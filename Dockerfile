FROM python:3.12-alpine
ARG CFN_LINT_VERSION

ADD https://github.com/aws-cloudformation/cfn-lint/archive/refs/tags/${CFN_LINT_VERSION}.tar.gz /root/cfn-lint.tar.gz
RUN cd /root && tar -xzf cfn-lint.tar.gz && rm -f cfn-lint.tar.gz && mv cfn-lint-* cfn-lint
RUN pip install /root/cfn-lint/
RUN rm -rf /root/cfn-lint/

CMD ["cfn-lint"]
