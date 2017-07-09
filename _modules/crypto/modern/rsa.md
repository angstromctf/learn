---
title: "RSA"
---

Up to this point, we've only been considering *symmetric* cryptosystems, which use the same key for encryption and decryption. Now, we'll see our first **asymmetric** cryptosystem, which uses two different keys, a **public key** and **private key**, which come together to form a **keypair**.

To see why asymmetric cryptography, also known as **public-key cryptography**, is so important, let's consider an important example: the Internet. If Alice is the Google server, and Bob is trying to securely look something up on Google, if we used a symmetric cryptosystem, they'd have to somehow agree on a shared key. However, if Alice and Bob have never met before, how can they agree on a key that only the two of them know? How can each of them trust each other over the Internet?

The solution to this problem is public-key cryptography. Alice, the trusted server, generated a public key and a private key. She sends the public key out to everyone, but keeps the private key for herself. This way, anyone can encrypt a search query with the public key, but only she can read these queries with her private key. Eventually, we'll learn how she can certify her public key as being legitimate.

### RSA

Now, we'll see an example of the most important public-key cryptosystem: **RSA**, or the Rivest-Shamir-Adleman algorithm.

#### Key Generation

RSA, like many other public-key cryptosystems, operates off of the inherent asymmetry in a computer problem: some type of operation that's easy to do, but really hard to undo. In RSA's case, this problem is multiplication: it's really easy to multiply two numbers together, but really hard to break them back apart by factoring.

In RSA, we usually multiply two prime numbers together to get a **semiprime**. It's easy to multiply two numbers together, but given just the semiprime, it's really hard to factor it back into the original primes.

Here's the basic process of RSA key generation:

1. Choose $$p, q$$ to be two large primes.
2. Compute $$N = pq$$, a semiprime known as the **RSA modulus**.
3. Choose an **encryption exponent**, $$e$$. Usually $$e = 65537$$.
4. Compute the **decryption exponent** $$d = e^{-1} \pmod{\phi(N)}$$.
5. The public key is just the numbers $$N$$ and $$e$$, which we denote as $$\langle N, e \rangle$$. The private key is $$\langle p,q,d \rangle$$.

In other words, the public key contains $$N$$, but to figure out the private key numbers $$p$$ and $$q$$ from the public key, you have to factor $$N$$.

#### Encryption

Once you have you public and private keys, the encrypted form $$C$$ of a message $$M$$ is as easy as $$C \equiv M^e \pmod{N}$$.

#### Decryption

The encrypted form of a message, $$C$$, can be reversed back to $$M$$ simply as $$M = C^d \equiv (M^e)^d \pmod{N}$$.

Why does RSA work? To prove it, we need to assert Euler's Theorem. We'll state it but not prove it here:

$$a^{\phi(N)} \equiv 1 \pmod{N}$$ for relatively prime $$a$$ and $$N$$.
