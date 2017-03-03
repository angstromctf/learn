---
layout: default
---

<h1>{{ page.title }}</h1>

{% assign children='' %}
{% include navigation.html node="/modules/" %}

{{ content }}
