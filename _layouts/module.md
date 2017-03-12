---
layout: default
---

<script src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML" type="text/javascript"></script>

<div class="row">
  <div class="col-3">
    <h3>Navigation</h3>

    <ol class="nav-list">
      {% include navigation.html node=site.root %}
    </ol>
  </div>

  <div class="col-9">
    {{ content }}

    {% if page.previous_module %} <a href="{{ page.previous_module.url }}" style="float: left;">&laquo; {{ page.previous_module.title }}</a> {% endif %}
    {% if page.next_module %} <a href="{{ page.next_module.url }}" style="float: right;">{{ page.next_module.title }} &raquo;</a> {% endif %}
    <br/>
  </div>
</div>
