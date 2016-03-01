all: clean compile

compile: clean protobuf
	javac -cp .:protobuf-2.5.0.jar: GossipInterface.java GossipNode.java
	rmiregistry &

clean:
	rm -rf com
	rm -rf .*.*.
	find . -name "*.class" -type f -delete
	if pgrep rmiregistry; then pkill rmiregistry; fi

protobuf:
	protoc -I=. --java_out=. Gossip.proto
