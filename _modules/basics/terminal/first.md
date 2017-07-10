---
title: Your First Terminal Experience
order: 2
---
When you first open terminal, you'll be greeted with a prompt like this:
<p style='text-align: center;'>
<img src='blankterm.png'/>
<br/>
What you get when you first open Terminal.
</p>

The only text you see is ``kisaayano@notamac:~$``. What does all this mean??! Let's break it down:

``kisaayano`` is me, the current user logged in. If your username is ``hiDerp``, then the prompt would display ``hiDerp`` there. The administrator account is always ``root`` in the terminal.

``@notamac`` represents the computer you're logged into. My computer is named "notamac", and thus that's the name shown. If I were logged into thetaeo's computer named "Gandalf", the prompt would display ``@Gandalf`` instead.

``:~`` represents the current directory you're in. The tilde is a special case - it means that I'm currently in my home directory. This is like ``C:\Users\Username`` in Windows, ``/home/username`` in Linux, and ``/Users/username`` in OS X. If I were in ``/home/kisaayano/Documents``, the prompt displays ``~/Documents``. 

``$`` is the last character of the beginning string. It simply tells you that the characters after it will be executed as commands. Different terminals use different characters for this, such as ``>``.
**WARNING!!!** If you see a ``#`` at the end of your prompt, that's dangerous!!! This means you're logged in as the root, or admin, user. You could cause catastrophic damage to your computer if you are not careful. It's best to stay in a normal shell with default privileges.

Now, bang some random keys and hit enter. If all is well, you'll see something like :
``bash: asdflskdjfls: command not found.``


