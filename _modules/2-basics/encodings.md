---
title: "Encodings"
---

In the previous section, we discussed how computers represent data as numbers using number systems. Next, let's see how these numbers can be used to represent text. The most popular and simple system in place to represent English text is called **ASCII** (American Standard Code for Information Interchange). ASCII is a **text encoding**: it represents, or *encodes*, text as numbers. In ASCII, the numbers 0 through 127 each correspond to a character: a number, letter, or special symbol. Here is a standard ASCII table that lists the corresponding character for the numbers 0 through 127:

<table class="table table-striped">
<tr><th>Decimal</th><th>Hex</th><th>Value</th><th>Decimal</th><th>Hex</th><th>Value</th><th>Decimal</th><th>Hex</th><th>Value</th><th>Decimal</th><th>Hex</th><th>Value</th></tr>
<tr><td>0</td><td>0</td><td><code>(null)</code></td><td>32</td><td>20</td><td><code>(space)</code></td><td>64</td><td>40</td><td><code>@</code></td><td>96</td><td>60</td><td><code>`</code></td></tr>
<tr><td>1</td><td>1</td><td><code>(start of heading)</code></td><td>33</td><td>21</td><td><code>!</code></td><td>65</td><td>41</td><td><code>A</code></td><td>97</td><td>61</td><td><code>a</code></td></tr>
<tr><td>2</td><td>2</td><td><code>(start of text)</code></td><td>34</td><td>22</td><td><code>"</code></td><td>66</td><td>42</td><td><code>B</code></td><td>98</td><td>62</td><td><code>b</code></td></tr>
<tr><td>3</td><td>3</td><td><code>(end of text)</code></td><td>35</td><td>23</td><td><code>#</code></td><td>67</td><td>43</td><td><code>C</code></td><td>99</td><td>63</td><td><code>c</code></td></tr>
<tr><td>4</td><td>4</td><td><code>(end of transmission)</code></td><td>36</td><td>24</td><td><code>$</code></td><td>68</td><td>44</td><td><code>D</code></td><td>100</td><td>64</td><td><code>d</code></td></tr>
<tr><td>5</td><td>5</td><td><code>(enquiry)</code></td><td>37</td><td>25</td><td><code>%</code></td><td>69</td><td>45</td><td><code>E</code></td><td>101</td><td>65</td><td><code>e</code></td></tr>
<tr><td>6</td><td>6</td><td><code>(acknowledge)</code></td><td>38</td><td>26</td><td><code>&</code></td><td>70</td><td>46</td><td><code>F</code></td><td>102</td><td>66</td><td><code>f</code></td></tr>
<tr><td>7</td><td>7</td><td><code>(bell)</code></td><td>39</td><td>27</td><td><code>'</code></td><td>71</td><td>47</td><td><code>G</code></td><td>103</td><td>67</td><td><code>g</code></td></tr>
<tr><td>8</td><td>8</td><td><code>(backspace)</code></td><td>40</td><td>28</td><td><code>(</code></td><td>72</td><td>48</td><td><code>H</code></td><td>104</td><td>68</td><td><code>h</code></td></tr>
<tr><td>9</td><td>9</td><td><code>\t (horizontal tab)</code></td><td>41</td><td>29</td><td><code>)</code></td><td>73</td><td>49</td><td><code>I</code></td><td>105</td><td>69</td><td><code>i</code></td></tr>
<tr><td>10</td><td>a</td><td><code>\n (new line)</code></td><td>42</td><td>2a</td><td><code>*</code></td><td>74</td><td>4a</td><td><code>J</code></td><td>106</td><td>6a</td><td><code>j</code></td></tr>
<tr><td>11</td><td>b</td><td><code>(vertical tab)</code></td><td>43</td><td>2b</td><td><code>+</code></td><td>75</td><td>4b</td><td><code>K</code></td><td>107</td><td>6b</td><td><code>k</code></td></tr>
<tr><td>12</td><td>c</td><td><code>(new page)</code></td><td>44</td><td>2c</td><td><code>,</code></td><td>76</td><td>4c</td><td><code>L</code></td><td>108</td><td>6c</td><td><code>l</code></td></tr>
<tr><td>13</td><td>d</td><td><code>\r (carriage return)</code></td><td>45</td><td>2d</td><td><code>-</code></td><td>77</td><td>4d</td><td><code>M</code></td><td>109</td><td>6d</td><td><code>m</code></td></tr>
<tr><td>14</td><td>e</td><td><code>(shift out)</code></td><td>46</td><td>2e</td><td><code>.</code></td><td>78</td><td>4e</td><td><code>N</code></td><td>110</td><td>6e</td><td><code>n</code></td></tr>
<tr><td>15</td><td>f</td><td><code>(shift in)</code></td><td>47</td><td>2f</td><td><code>/</code></td><td>79</td><td>4f</td><td><code>O</code></td><td>111</td><td>6f</td><td><code>o</code></td></tr>
<tr><td>16</td><td>10</td><td><code>(data link escape)</code></td><td>48</td><td>30</td><td><code>0</code></td><td>80</td><td>50</td><td><code>P</code></td><td>112</td><td>70</td><td><code>p</code></td></tr>
<tr><td>17</td><td>11</td><td><code>(device control 1)</code></td><td>49</td><td>31</td><td><code>1</code></td><td>81</td><td>51</td><td><code>Q</code></td><td>113</td><td>71</td><td><code>q</code></td></tr>
<tr><td>18</td><td>12</td><td><code>(device control 2)</code></td><td>50</td><td>32</td><td><code>2</code></td><td>82</td><td>52</td><td><code>R</code></td><td>114</td><td>72</td><td><code>r</code></td></tr>
<tr><td>19</td><td>13</td><td><code>(device control 3)</code></td><td>51</td><td>33</td><td><code>3</code></td><td>83</td><td>53</td><td><code>S</code></td><td>115</td><td>73</td><td><code>s</code></td></tr>
<tr><td>20</td><td>14</td><td><code>(device control 4)</code></td><td>52</td><td>34</td><td><code>4</code></td><td>84</td><td>54</td><td><code>T</code></td><td>116</td><td>74</td><td><code>t</code></td></tr>
<tr><td>21</td><td>15</td><td><code>(negative acknowledge)</code></td><td>53</td><td>35</td><td><code>5</code></td><td>85</td><td>55</td><td><code>U</code></td><td>117</td><td>75</td><td><code>u</code></td></tr>
<tr><td>22</td><td>16</td><td><code>(synchronous idle)</code></td><td>54</td><td>36</td><td><code>6</code></td><td>86</td><td>56</td><td><code>V</code></td><td>118</td><td>76</td><td><code>v</code></td></tr>
<tr><td>23</td><td>17</td><td><code>(end of transmission block)</code></td><td>55</td><td>37</td><td><code>7</code></td><td>87</td><td>57</td><td><code>W</code></td><td>119</td><td>77</td><td><code>w</code></td></tr>
<tr><td>24</td><td>18</td><td><code>(cancel)</code></td><td>56</td><td>38</td><td><code>8</code></td><td>88</td><td>58</td><td><code>X</code></td><td>120</td><td>78</td><td><code>x</code></td></tr>
<tr><td>25</td><td>19</td><td><code>(end of medium)</code></td><td>57</td><td>39</td><td><code>9</code></td><td>89</td><td>59</td><td><code>Y</code></td><td>121</td><td>79</td><td><code>y</code></td></tr>
<tr><td>26</td><td>1a</td><td><code>(substitute)</code></td><td>58</td><td>3a</td><td><code>:</code></td><td>90</td><td>5a</td><td><code>Z</code></td><td>122</td><td>7a</td><td><code>z</code></td></tr>
<tr><td>27</td><td>1b</td><td><code>(escape)</code></td><td>59</td><td>3b</td><td><code>;</code></td><td>91</td><td>5b</td><td><code>[</code></td><td>123</td><td>7b</td><td><code>{</code></td></tr>
<tr><td>28</td><td>1c</td><td><code>(file separator)</code></td><td>60</td><td>3c</td><td><code><</code></td><td>92</td><td>5c</td><td><code>\</code></td><td>124</td><td>7c</td><td><code>|</code></td></tr>
<tr><td>29</td><td>1d</td><td><code>(group separator)</code></td><td>61</td><td>3d</td><td><code>=</code></td><td>93</td><td>5d</td><td><code>]</code></td><td>125</td><td>7d</td><td><code>}</code></td></tr>
<tr><td>30</td><td>1e</td><td><code>(record separator)</code></td><td>62</td><td>3e</td><td><code>></code></td><td>94</td><td>5e</td><td><code>^</code></td><td>126</td><td>7e</td><td><code>~</code></td></tr>
<tr><td>31</td><td>1f</td><td><code>(unit separator)</code></td><td>63</td><td>3f</td><td><code>?</code></td><td>95</td><td>5f</td><td><code>_</code></td><td>127</td><td>7f</td><td><code>(delete)</code></td></tr>
</table>
<br/>

Remember that a byte is eight bits, or a number between 0 and 255. In an ASCII-encoded text file, each of these bytes corresponds to a character in the above table. For text in other languages, more complex encoding schemes are used to capture a much broader scheme of characters. The most promiment and widely used encoding scheme on the Internet is called Unicode: you'll see it called UTF-8, UTF-16, or UTF-32, depending on the version. Unicode includes characters, or *glyphs*, for hundreds of languages, as well as many specialized characters representing things like emoticons.
