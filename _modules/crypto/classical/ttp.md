---
title: Breaking the Two Time Pad
order: 3
---
Let's say that Bob is trying to send a message to Alice ``GIVEMEFOOD``,
which as a hex string is ``474956454d45464f4f44``.
He encodes it with the key ``56515a5a494c514d4c54``,
which gives him the ciphertext ``11180c1f040917020310``.
He sends this off to Alice, who sends him a CAD of a pepperoni pizza. Bob proceeds to print this out, and they both are happy.

Let's say Bob wants to send Alice another message ``MENEEDRICE``, because rice is the ultimate food. Also, piracy of rice CADs has grown exponentially, and as a result the government has banned posting rice CADs online.

Sadly, Bob is a lazy bum so he encodes it with the same key, giving him the ciphertext ``1b14141f0c0803040f11``.

If Eve gets these two ciphertexts, she can't do anything because it's close enough to using the OTP, right? **Wrong**.

Let's say she guesses the key is the same and XORs the two ciphertexts together. Because the first ciphertext is ``Message 1`` XOR ``key`` and the second ciphertext is ``Message 2`` XOR ``key``, when we XOR the ciphertexts together we get ``Message 1`` XOR ``Message 2`` XOR ``key`` XOR ``key``. Because of XOR properties, ``key`` XOR ``key`` cancels, and it is essentially ``Message 1`` XOR ``Message 2``

But if something XOR itself just cancels, if Eve XORs either message with what Eve just got, then that means she can get the other message too!
What's even worse is that if she guesses part of one message, she can see the corresponding part revealed in the other message and make guesses from there!

A good visual example of the process just described can be found at mixedmath's response [here.](http://crypto.stackexchange.com/questions/59/taking-advantage-of-one-time-pad-key-reuse)

**TL;DR**: Don't reuse keys. Key reuse, especially with OTP, makes the messages almost trivial to decipher.
