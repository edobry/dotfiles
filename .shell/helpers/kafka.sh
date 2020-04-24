alias kafkacatd='docker run --tty --interactive --rm edenhill/kafkacat:1.5.0 kafkacat -b'

function listTopics() {
    kafkacatd $1 -L | grep "topic \"" | awk '{ print $2 }' | sed 's/\"//g'
}

function readTopic() {
    kafkacatd $1 -C -t $2 -o -$3 -qe
}

