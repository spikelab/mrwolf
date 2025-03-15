# Mr Wolf - exploring agentic systems

<img src="media/mrwolf.jpg" width="50%" alt="Mr Wolf">

## Overview
The main goal is to explore the space of AI Agents and Agentic systems and finally build something end-to-end so that, with the confidence that only comes from doing, I can tell what's real and what works instead of feeling lost between the market hype and the research papers. All of this while building a personal assistant, and who better than Mr Wolf... the character from Pulp Fiction whose famous line is *[I solve problems](https://www.youtube.com/watch?v=ZN12-hJI7ws)*.

While the aim is to create something that can be used, and therefore tested, in real-life (instead of benchmarks), the project is ultimately focused on technical exploration with several specific goals:

- **RAG**: Going beyond simple vectorization and cosine similarity tutorials to explore the complexities of ingesting a variety of documents (understanding special formats, how to deal with tabular data, parsing and chunking choices) to retrieval mechanisms (reranking, hybrid search, etc)
- **Prompting, agent collaboration and ReACT strategies**: Investigating how effectively multiple bots can collaborate, how prompting affects final results, and testing different prompts and models (hopefully with an A/B testing tool similar to [ChainForge](https://chainforge.ai/))
- **Explore multimodal (Voice/Image)**: Learning more about voice, more deeply understanding the challenges and the delta between something high quality like 11Labs with common solutions such as AWS Polly, plus exploring image genereration with new models like Flux.
- **Hallucination**: how frequent are they actually are and how much can they really be curbed
- **Memory and self-learning**: short and long term, how to get models to remember without getting confused and learn and improve as they work and get feedback
- **Costs and failures**: Measuring real-world agent failure rates and operational costs with normal daily usage, especially with ASR/TTS

Part of the fun and exploration will also be to use GH Copilot and other AI coding tools like Claude Code to see how it works on a full project as opposed little scripts which is all I've used these tools for so far.

## Tech Stack
To focus on AI rather than plumbing and ensure immediate mobile access, the project makes several opinionated technology choices:

- [Docker](https://www.docker.com) for local development
- [n8n](https://n8n.io) as a lowcode solution to model agents and connect to 3rd party services. It also aligns with my basic mental framework of workflows as agents.
- [PostgreSQL](https://www.postgresql.org) as the primary database
  - Compatible with n8n, supports embeddings via [pgvector](https://github.com/pgvector/pgvector) extension and enables hybrid search
  - [pgAdmin](https://www.pgadmin.org) included for database exploration
- [Telegram](https://telegram.org) as the communication channel, saves us having to build a UI to start with and allows for all sorts of media interaction on any devide
- [Metabase](https://www.metabase.com) for easy observability from day one, makes it a breeze to create any dashboard
- [Bedrock](https://aws.amazon.com/bedrock/) for easy LLM access without needing 20 accounts, LLama 3 for the most, cohere for embeddings and reranking, stability for images, Polly/Transcribe for voice. This should be a solid baseline that can be taken to production with ease and then used for comparison with other models.

## Non-Focus Areas
The project currently does not focus on:

- Latency and scalability, although these ultimately make a significant difference
- Realtime/streaming, particularly for voice (the current implementation uses audio messages rather than calls, and n8n doesn't support streaming)

## System Design
<img src="media/supervisor-diagram.png" width="50%" alt="Mr Wolf">

This project is focused on the director->subagents->tasks model. In this design a main agent receives the incoming queries and decides which agent to delegate to which eventually performs the tasks and returns to the director agent. One of the things to clarify is who does the evaluation, if every subagent has a companion agent for evaluations or not, perhaps using a different model, but otherwise the design should be pretty straightforward. All agents will be implemented as their own flow with the director flow calling the other flows.

One more thing that's also discussed in the resources below is the human in the loop. The project will explore how to get feedback, but also permissions from humans to proceed with a certain set of actions.

These are a couple resources that clearly explain the model, one implemented on N8N (his flows will be included in the default repo) and another with another platform, Relevance AI:

Nate Herk - I Built the Ultimate Team of AI Agents in n8n With No Code (Free Template)
[![Nate Herk - I Built the Ultimate Team of AI Agents in n8n With No Code (Free Template)](https://img.youtube.com/vi/9FuNtfsnRNo/0.jpg)](https://www.youtube.com/watch?v=9FuNtfsnRNo)

Ben AI - This 20+ AI Agent Team Automates ALL Your Work (GPT-01) (Relevance AI)
[![Ben AI - This 20+ AI Agent Team Automates ALL Your Work (GPT-01) (Relevance AI)](https://img.youtube.com/vi/Lj5fyDX01v8/0.jpg)](https://www.youtube.com/watch?v=Lj5fyDX01v8)

(...yes, everything and anything... welcome to the hype and clickbait)

Something like that will represent the backbone and the baseline, but then the real work begins to go in depth on the above topics and try to implement much more complex RAG solutions, try different prompts and so on.This 20+ AI Agent Team Automates ALL Your Work (GPT-01) (Relevance AI).

## Getting Started
You need docker installed, then just checkout this repo and run docker-compose -f docker/docker-compose.yml up -d and you should see 4 containers showing up:

- postgres
- n8n
- pgadmin
- metabase

Besides that, you will need to setup telegram and the accounts to AWS and whatever other 3rd party tool we use (say google for email and drive)

## Contributing
It's all about exploration because doing is 100 times better than just watching videos and reading stuff, feel free to join, the more the merrier.

## Todo
See open issues and The Stuff project for things to pick up.

### Hackatons
Because stuff is more fun together, as much as possible I'd like to work in burst along with other people, possibly in realtime. As such I will try to organize some period hackatons to move the project forward as on a daily basis I simply don't have enough time between work and family.