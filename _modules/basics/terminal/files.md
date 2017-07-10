---
title: Files and Directories
order: 3
---
In graphical operating systems, you usually have a graphical file manager, like Finder or File Explorer.
<p style='text-align: center;'>
<img src='nautilus.png'/>
<br/>
A graphical file manager.
</p>

We can also represent the file structure in terms of a tree -
<p style='text-align: center;'>
<img src='file_manager.jpg'/>
<br/>
A tree like representation of files.
</p>

We see that the ``/`` directory is the highest up in this tree. All the other files are within the ``/`` directory.

Let's say you want to access your file under ``.gnome``, and you're currently in ``me``. The command **``ls``** lists all the files and folders in the current directory. If we did ``ls``, we would see
```
.enlightenment
.gnome
.gnome-desktop
etc...
```
Now if we want to get to a directory, we can do **``cd``**, which stands for "change directory". To get to ``.gnome`` we type ``cd .gnome`` and hit ``↵ Enter``. Now, we are in the ``.gnome`` directory, and we can ``ls`` to see our files here. If you get lost in the directory tree, **``pwd``** will come to the rescue! It stands for "Path to working directory" and prints out the path to where you currently are. So if we are in ``.gnome``, we see from the picture above its under ``me``, which is under ``home``, which is under ``/``. Thus, ``pwd`` would print out ``/home/me/.gnome``. To go up in the directory tree, for example from ``.gnome`` to ``me``, you would do ``cd ..``. One period represents the current directory, while two represents the *parent* directory, or the directory directly above.

``cd`` by default uses **relative paths**. This means that for any cd command ``cd blah``, it searches the current folder for ``blah``, but if ``blah`` is not found it errors and stops. For example, say we need a file from the folder ``karen``, but we're in ``.gnome``. If we type ``cd karen``, the terminal will say: ``karen: file or directory not found``. To get to `karen` we would need to type the **absolute path** to the file. The absolute path simply displays the full path from the root directory, `/`, to the file. For the folder `karen`, this would be `/home/ftp/karen`. Essentially, the absolute path is like a map - no matter from where you are in the folder tree, you can get to where you want. The relative path is like GPS directions: they could take you to a different place depending on where you start. 
