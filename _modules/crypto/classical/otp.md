---
title: The One Time Pad - Perfect Secrecy?
order: 2
---
When we want to send a secret message, we need to consider how "secret" a encryption algorithm is. An *encryption algorithm* is a computer algorithm you use to transform some data into a format that other people can't read without a special key to unlock or "decrypt" the data. You can imagine that

``th1s 1s 3ncrypt3d``

is less secure than

``VGhpcyBpcyBlbmNyeXB0ZWQ=``

Both are different ways of encoding the message ``This is encrypted``. We call the original message the *plaintext* and the encrypted messages the *ciphertext*. The first simply replaces some letters with numbers. It is quite easy to see what the original sentence was. The second is encoded using the AES-CBC encryption algorithm with the key ``flagz_for_funz`` and initialization vector ``692ed67cd7bfee05358f33899189eccc`` (we'll explain what this means later). It's essentially impossible, without that information about the key, for an attacker to guess that the ciphertext came from ``This is encrypted``.

Coming up with a perfect method for encryption is hard. Really hard. One of the only methods that has "perfect secrecy" is the *one-time pad (OTP)*.

Imagine you have two infinitely long books (how were they printed? Magic.) and both are filled with just random hexadecimal numbers and letters. If you flipped to a page, you might see ``0b8a90308dc48c357e8ada81a49``, but you would be equally likely to see ``21ccdd626bb768a223c8c9c96d27``.

Let's take Alice, Bob, and Eve again. Alice has the message ``I'm having a party tomorrow.`` which she would like to send to Bob. She does not want Eve to learn about this party, because Eve is quite a party pooper. The first thing Alice does is **converts her string into binary**. She then goes to the first page of her book, and picks the first n characters from the book, where n is the length of her message. She then **converts her picked characters into binary**, and then **crosses the characters she used out of her book**. Next, she [XOR's](http://www.wikiwand.com/en/Exclusive_or) the two strings together. She now can safely send this to Bob, knowing that it is impossible for Eve to decrypt the message into "I'm having a party tomorrow.". However, Bob can easily decrypt this message by taking the n characters from *his* book, turning them into binary, and XORing them with Alice's message. We call this cipher the **One Time Pad (OTP)** because each key from our book is only used once. Eve has no way of knowing how the message was made - any string of random digits and characters could have been the key. The message could easily have been ``I'm taking a quizz tomorrow.``. Since Eve doesn't know what random key was used, she can't conclusively determine what the message was. There are problems with this, however. Can you think of any of them?

First off, the problem of exchanging the books. We assumed at the beginning that both Alice and Bob had the same book of random characters. We also assumed the books were of infinite length. In reality, we cannot have infinite length books for obvious reasons. Ignoring that, we need to ask how the books were exchanged. Alice and Bob would have to set up a time to exchange the books by communicating. However, since these messages are not secured, Eve could find them and interrupt the key exchange meeting.

Now in the modern day of computers, we would want to generate a random key for each message we send. But this means exchanging a key of the message length *n* every time we send data, effectively doubling the amount of data that needs to be sent.

**TL;DR**: OTP can give perfect secrecy, but it's hard to implement in reality. It can also be cracked if used improperly, as we will see in the next chapter.
