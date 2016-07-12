Since ancient times, people have tried to figure out ways communicate securely with each other. One of Julius Caesar's strongest military advantages was the use of the Caesar cipher (studied in the next module), which he used to send secret messages to his troops, without the enemy being able to interpret them. The study of secure communication methods is called **cryptography**. These secure communication methods are often known as **cryptosystems**.

Here's one type of scenario we might use cryptography to address. Let's imagine we have three people - Alice, Bob, and Eve. Alice and Bob are best friends, but they don't like Eve very much. Likewise, Eve doesn't like Alice or Bob. On this particular day, Alice is planning a party. She wants to invite Bob, but not Eve. Eve, being an evil person, has the ability to intercept all messages between Alice and Bob. What might Alice do to ensure Eve does not learn about the party?

Throughout the rest of this guide and the broader field of cryptography, Alice and Bob will continue to be the two major parties in our cryptography systems. Eve will be the *eavesdropper*, listening in on Alice and Bob's conversation without interfering with or changing it. This type of attack on Alice and Bob's conversation is known as a **passive attack**. If Eve started changing or interfering with the conversation, she would be executing an **active attack**, and would be better known as Mallory, the *malicious attacker*. You might also see Carol and Dave, if the cryptosystem requires more than two participants.

<figure class="figure">
    <img class="figure-img center-block" src="http://imgs.xkcd.com/comics/security.png"></img>
    <figcaption class="figure-caption text-center">Basically how cryptography works in real life.</figcaption>
</figure>

In this section, we'll start by reviewing some classical cryptosystems and basic vocabulary. We'll move from there to more modern systems like RSA and AES.