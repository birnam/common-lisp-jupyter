FROM yitzchak/clj-test:latest

ARG APP_USER=app
ARG APP_UID=1000

COPY --chown=${APP_UID}:${APP_USER} . ${HOME}/common-lisp-jupyter
COPY --chown=${APP_UID}:${APP_USER} . ${HOME}/quicklisp/local-projects/common-lisp-jupyter

RUN cd common-lisp-jupyter; ros install ./common-lisp-jupyter.asd; exit 0
RUN cd common-lisp-jupyter; ros install ./common-lisp-jupyter.asd && \
  ros run --lisp ccl-bin --eval "(ql:quickload :common-lisp-jupyter)" \
  --eval "(cl-jupyter:install-roswell :implementation \"ccl-bin\")" --quit
RUN cd common-lisp-jupyter; \
  clasp --eval "(ql:quickload :common-lisp-jupyter)" \
    --eval "(cl-jupyter:install :use-implementation t)" --eval "(core:quit)"

WORKDIR ${HOME}/common-lisp-jupyter/examples 
