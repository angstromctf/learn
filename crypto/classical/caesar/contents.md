One of Julius Caesar's foremost assets in the wars he fought was, in fact, a simple substition cipher called the **Caesar cipher**. He used to send secret messages to his troops across enemy lines, foreshadowing the essential nature of cryptography in modern warfare and communication in general. The Caesar cipher operates on a simple principle: it takes a plaintext and a key, which is a number between 1 and 25. It might be easiest to illustrate how it works with an example.

Let's consider the plaintext `ATTACK AT DAWN`, the sort of message Caesar might be sending. Also, we need to pick a key: how about 3 (which is the key Caesar always used, and somehow his enemies never figured it out). What we're going to do is "add the key to each letter": since the key is 3, we'll be replacing `A` with `D`, `B` with `E`, `C` with `F`, all the way around to `W` with `Z`, `X` with `A`, `Y` with `B`, and `Z` with `C` (it wraps around). If the key was 1, `A` would be replaced with `B`, if it was 2, `A` would be replaced with `C`. If it was 13 `A` would go to `N`. So, our message `ATTACK AT DAWN` becomes `DWWDFN DW GDZQ`. Caesar sends it to his troops, and even if the enemy general Eve intercepts it, she can't figure out what it means. All his troops have to do is subtract the key, 3, from each letter, and they'll get back his original message.

Wow! This is our first cipher. It might seem cool, but it turns out to be really easy to defeat, even for a classical cryptosystem. Now, we'll consider the *cryptanalysis* of the Caesar cipher, and try to figure out what some ciphertext means: `Z BEFN KYV XIVVBJ RIV YZUUVE ZE KYV KIFARE YFIJV`.

### Brute-Force

The first, and easiest, attack that can break the Caesar cipher is a **brute-force** attack. By this, we mean just trying every possible key. There are only 25 of them, so it's easy to check each one, especially if you have a computer. Let's do it!

<table class="table table-striped">
    <tr><th>Key</th><th>Plaintext Attempt</th></tr>
    <tr><td>0</td><td><code>Z BEFN KYV XIVVBJ RIV YZUUVE ZE KYV KIFARE YFIJV</code></td></tr>
    <tr><td>1</td><td><code>Y ADEM JXU WHUUAI QHU XYTTUD YD JXU JHEZQD XEHIU</code></td></tr>
    <tr><td>2</td><td><code>X ZCDL IWT VGTTZH PGT WXSSTC XC IWT IGDYPC WDGHT</code></td></tr>
    <tr><td>3</td><td><code>W YBCK HVS UFSSYG OFS VWRRSB WB HVS HFCXOB VCFGS</code></td></tr>
    <tr><td>4</td><td><code>V XABJ GUR TERRXF NER UVQQRA VA GUR GEBWNA UBEFR</code></td></tr>
    <tr><td>5</td><td><code>U WZAI FTQ SDQQWE MDQ TUPPQZ UZ FTQ FDAVMZ TADEQ</code></td></tr>
    <tr><td>6</td><td><code>T VYZH ESP RCPPVD LCP STOOPY TY ESP ECZULY SZCDP</code></td></tr>
    <tr><td>7</td><td><code>S UXYG DRO QBOOUC KBO RSNNOX SX DRO DBYTKX RYBCO</code></td></tr>
    <tr><td>8</td><td><code>R TWXF CQN PANNTB JAN QRMMNW RW CQN CAXSJW QXABN</code></td></tr>
    <tr><td>9</td><td><code>Q SVWE BPM OZMMSA IZM PQLLMV QV BPM BZWRIV PWZAM</code></td></tr>
    <tr><td>10</td><td><code>P RUVD AOL NYLLRZ HYL OPKKLU PU AOL AYVQHU OVYZL</code></td></tr>
    <tr><td>11</td><td><code>O QTUC ZNK MXKKQY GXK NOJJKT OT ZNK ZXUPGT NUXYK</code></td></tr>
    <tr><td>12</td><td><code>N PSTB YMJ LWJJPX FWJ MNIIJS NS YMJ YWTOFS MTWXJ</code></td></tr>
    <tr><td>13</td><td><code>M ORSA XLI KVIIOW EVI LMHHIR MR XLI XVSNER LSVWI</code></td></tr>
    <tr><td>14</td><td><code>L NQRZ WKH JUHHNV DUH KLGGHQ LQ WKH WURMDQ KRUVH</code></td></tr>
    <tr><td>15</td><td><code>K MPQY VJG ITGGMU CTG JKFFGP KP VJG VTQLCP JQTUG</code></td></tr>
    <tr><td>16</td><td><code>J LOPX UIF HSFFLT BSF IJEEFO JO UIF USPKBO IPSTF</code></td></tr>
    <tr><td>17</td><td><code>I KNOW THE GREEKS ARE HIDDEN IN THE TROJAN HORSE</code></td></tr>
    <tr><td>18</td><td><code>H JMNV SGD FQDDJR ZQD GHCCDM HM SGD SQNIZM GNQRD</code></td></tr>
    <tr><td>19</td><td><code>G ILMU RFC EPCCIQ YPC FGBBCL GL RFC RPMHYL FMPQC</code></td></tr>
    <tr><td>20</td><td><code>F HKLT QEB DOBBHP XOB EFAABK FK QEB QOLGXK ELOPB</code></td></tr>
    <tr><td>21</td><td><code>E GJKS PDA CNAAGO WNA DEZZAJ EJ PDA PNKFWJ DKNOA</code></td></tr>
    <tr><td>22</td><td><code>D FIJR OCZ BMZZFN VMZ CDYYZI DI OCZ OMJEVI CJMNZ</code></td></tr>
    <tr><td>23</td><td><code>C EHIQ NBY ALYYEM ULY BCXXYH CH NBY NLIDUH BILMY</code></td></tr>
    <tr><td>24</td><td><code>B DGHP MAX ZKXXDL TKX ABWWXG BG MAX MKHCTG AHKLX</code></td></tr>
    <tr><td>25</td><td><code>A CFGO LZW YJWWCK SJW ZAVVWF AF LZW LJGBSF ZGJKW</code></td></tr>
</table>

As you can see, key 17 corresponds to the ciphertext `I KNOW THE GREEKS ARE HIDDEN IN THE TROJAN HORSE`. This is an example of a **ciphertext-only attack**: all we know is the original ciphertext. This is generally the hardest type of attack to carry out.

### Known-Plaintext Attack

The astute reader will have noticed that, in fact, we do know something about the plaintext corresponding to our message, even without using brute force. The first word of the ciphertext, `Z`, is only one letter long. There are only two words in English that are one letter long: `A` and `I`. Therefore, we can greatly narrow down our search, to only the keys 17 and 25. This is an example of a (partial) **known-plaintext attack**. If we knew the whole plaintext perfectly, it would be even easier to figure out the key.