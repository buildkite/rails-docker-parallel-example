cat .buildkite/pipeline.yml | sed "s/\$BUILDKITE_AGENT_META_DATA_QUEUE/$BUILDKITE_AGENT_META_DATA_QUEUE/" | buildkite-agent pipeline upload
