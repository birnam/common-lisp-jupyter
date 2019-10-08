FROM yitzchak/clj-test:latest

ARG APP_USER=app
ARG APP_UID=1000

COPY . $HOME/common-lisp-jupyter
COPY . $HOME/quicklisp/local-projects/common-lisp-jupyter
USER root
RUN chown -R $APP_USER:$APP_USER ~/common-lisp-jupyter ~/quicklisp/local-projects/common-lisp-jupyter

USER $APP_USER
RUN cd common-lisp-jupyter; ros install ./common-lisp-jupyter.asd; exit 0
RUN cd common-lisp-jupyter; ros install ./common-lisp-jupyter.asd && \
  ros run --lisp ccl-bin --eval "(ql:quickload :common-lisp-jupyter)" \
  --eval "(cl-jupyter:install-roswell :implementation \"ccl-bin\")" --quit
RUN cd common-lisp-jupyter; \
  clasp --eval "(ql:quickload :common-lisp-jupyter)" \
    --eval "(cl-jupyter:install :use-implementation t)" --eval "(core:quit)"

WORKDIR ${HOME}/common-lisp-jupyter/examples 
