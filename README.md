# tiktoken-server

Docker container to expose the  OpenAI BPE tokenizer as a REST service. Uses the tiktoken project  https://github.com/openai/tiktoken

## Building
    docker build -t tiktoken-server .

## Running 
    docker run -it -p127.0.0.1:5000:5000 tiktoken-server
    tailscale serve -bg 5000

## Calling using curl
    $ curl -d '{"prompt" : "hello world", "model" : "gpt-4o"}' -H "Content-Type: application/json"  http://localhost:5000/tokenize

    $ curl -d '{"prompt" : "hello world", "model" : "gpt-4o"}' -H "Content-Type: application/json"  https://{TAILSCALE_HOSTNAME}.taild1085.ts.net/tokenize