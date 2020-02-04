alias kafkacat-d='docker run --tty --interactive --rm edenhill/kafkacat:1.5.0 kafkacat -b 172.27.115.6'

alias listTopics="kafkacat-d -L | grep 'topic \"' | awk '{ print \$2 }' | sed 's/\"//g'"

function readTopic() {
    kakfacat-d -C -t $1 -o -$2 -s avro -r http://172.27.115.6:8081 -qe
}

