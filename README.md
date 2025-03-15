# Mr Wolf - exploring agentic systems

<img src="media/mrwolf.jpg" width="50%" alt="Mr Wolf">

## Overview
This project is inspired by the character Mr. Wolf from Pulp Fiction, whose famous line is ["I solve problems"](https://www.youtube.com/watch?v=ZN12-hJI7ws). The main goal is to explore the space of AI Agents and Agentic systems and finally build something end-to-end, while building a personal agent to solve everyday problems such as reminders, note taking (voicenotes) and organizing stuff across different applications Notion, Google Drive, calendars, etc).

While the aim is to create something that can be used, and therefore tested, in real-life rather than just running against benchmarks, the project is ultimately focused on technical exploration with several specific goals:

- **RAG**: Going beyond simple vectorization and cosine similarity tutorials to explore the complexities of Retrieval-Augmented Generation, from ingestion challenges (understanding input documents, parsing and chunking choices) to retrieval mechanisms (reranking, hybrid search, etc)
- **Prompting, delegation and ReACT strategies**: Investigating how effectively multiple bots can collaborate, how prompting affects final results, and testing different prompts and models (hopefully with an A/B testing tool similar to [ChainForge](https://chainforge.ai/))
- **Explore multimodal (Voice/Image)**: Learning more about voice, more deeply understanding the channels of building something high quality like 11Labs and the delta with common solutions such as AWS Polly, plus exploring image genereration with new models like Flux.
- **Costs and failures**: Measuring real-world agent failure rates and operational costs with normal daily usage, especially with ASR/TTS

Part of the fun and exploration will also be to use GH Copilot and other AI coding tools like Claude Code to see how it works on a full project as opposed little scripts which is all I've used these tools for so far. (this md was generated/formatted by Claude)

## Tech Stack
To focus on AI rather than plumbing and ensure immediate mobile access, the project makes several opinionated technology choices:

- [Docker](https://www.docker.com) for local development
- [n8n](https://n8n.io) as a lowcode solution to model agents and connect to 3rd party services. It also aligns with my basic mental framework of workflows as agents.
- [PostgreSQL](https://www.postgresql.org) as the primary database
  - Compatible with n8n, supports embeddings via [pgvector](https://github.com/pgvector/pgvector) extension and enables hybrid search
  - [pgAdmin](https://www.pgadmin.org) included for database exploration
- [Telegram](https://telegram.org) as the communication channel, saves us having to build a UI to start with and allows for all sorts of media interaction on any devide
- [Metabase](https://www.metabase.com) for easy observability from day one, makes it a breeze to create any dashboard

## Non-Focus Areas
The project currently does not focus on:

- Latency and scalability, although these ultimately make a significant difference
- Realtime/streaming, particularly for voice (the current implementation uses audio messages rather than calls, and n8n doesn't support streaming)

## Getting Started
You need docker installed and that's about it, then just checkout this repo and run docker-compose -f docker/docker-compose.yml up -d and you should see 4 containers showing up:

- postgres
- n8n
- pgadmin
- metabase

## Contributing
It's all about exploration because doing is 100 times better than just watching videos and reading stuff, feel free to join, the more the merrier

## Todo
See open issues and The Stuff project for things to pick up.

### Hackatons
Because stuff is more fun together, as much as possible I'd like to work in burst along with other people, possibly in realtime. As such I will try to organize some period hackatons to move the project forward as on a daily basis I simply don't have enough time between work and family.