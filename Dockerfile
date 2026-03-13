FROM legionio/legion

COPY . /usr/src/app/lex-pagerduty

WORKDIR /usr/src/app/lex-pagerduty
RUN bundle install
