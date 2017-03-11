---
title: "Reverse Engineering"
---

Reverse Engineering is a relatively old topic - ever since someone began writing software, someone has been trying to reverse engineer it. But what does this term mean? Reverse engineering is the process of extracting information from a program in order to figure out how to recreate it or to discover a vulnerability that you can exploit.

However, before we can discuss reverse engineering, how does a executable program actually work? Let's look into how code goes from source to binary (compilation), how this code runs (execution), and some common vulnerabilities found in executables. We'll focus on ELFs, but we'll also touch on Windows executables.
