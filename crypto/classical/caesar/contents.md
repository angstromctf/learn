One of Julius Caesar's foremost assets in the wars he fought was, in fact, a simple substition cipher called the **Caesar cipher**. He used to send secret messages to his troops across enemy lines, foreshadowing the essential nature of cryptography in modern warfare and communication in general. The Caesar cipher operates on a simple principle: it takes a plaintext and a key, which is a number between 1 and 25. It might be easiest to illustrate how it works with an example.

Let's consider the plaintext `ATTACK AT DAWN`, the sort of message Caesar might be sending. Also, we need to pick a key: how about 3 (which is the key Caesar always used, and somehow his enemies never figured it out). What we're going to do is "add the key to each letter": since the key is 3, we'll be replacing `A` with `D`, `B` with `E`, `C` with `F`, all the way around to `W` with `Z`, `X` with `A`, `Y` with `B`, and `Z` with `C` (it wraps around). If the key was 1, `A` would be replaced with `B`, if it was 2, `A` would be replaced with `C`. If it was 13 `A` would go to `N`. So, our message `ATTACK AT DAWN` becomes `DWWDFN DW GDZQ`. Caesar sends it to his troops, and even if the enemy general Eve intercepts it, she can't figure out what it means. All his troops have to do is subtract the key, 3, from each letter, and they'll get back his original message.

Wow! This is our first cipher. It might seem cool, but it turns out to be really easy to defeat, even for a classical cryptosystem. Now, we'll consider the *cryptanalysis* of the Caesar cipher, and try to figure out what some ciphertext means: `Z BEFN KYV XIVVBJ RIV YZUUVE ZE KYV KIFARE YFIJV`.

### Brute-Force

The first, and easiest, attack that can break the Caesar cipher is a **brute-force** attack. By this, we mean just trying every possible key. There are only 25 of them, so it's easy to check each one, especially if you have a computer. Let's do it!

<div class="panel panel-default">
    <div class="panel-heading">Caesar Cipher Brute Force</div>
    <div class="panel-body">
        <form onsubmit="return false;">
            <label for="ciphertext-brute-force">Plaintext</label>
            <input type="text" class="form-control" id="ciphertext-brute-force" value="Z BEFN KYV XIVVBJ RIV YZUUVE ZE KYV KIFARE YFIJV" oninput="update_brute_force();">
        </form>

        <table class="table table-striped">
            <tr><th style="width: 10%;">Key</th><th style="width: 90%;">Plaintext Attempt</th></tr>
            <tr><td>0</td><td><code id="plaintext0"></code></td></tr>
            <tr><td>1</td><td><code id="plaintext1"></code></td></tr>
            <tr><td>2</td><td><code id="plaintext2"></code></td></tr>
            <tr><td>3</td><td><code id="plaintext3"></code></td></tr>
            <tr><td>4</td><td><code id="plaintext4"></code></td></tr>
            <tr><td>5</td><td><code id="plaintext5"></code></td></tr>
            <tr><td>6</td><td><code id="plaintext6"></code></td></tr>
            <tr><td>7</td><td><code id="plaintext7"></code></td></tr>
            <tr><td>8</td><td><code id="plaintext8"></code></td></tr>
            <tr><td>9</td><td><code id="plaintext9"></code></td></tr>
            <tr><td>10</td><td><code id="plaintext10"></code></td></tr>
            <tr><td>11</td><td><code id="plaintext11"></code></td></tr>
            <tr><td>12</td><td><code id="plaintext12"></code></td></tr>
            <tr><td>13</td><td><code id="plaintext13"></code></td></tr>
            <tr><td>14</td><td><code id="plaintext14"></code></td></tr>
            <tr><td>15</td><td><code id="plaintext15"></code></td></tr>
            <tr><td>16</td><td><code id="plaintext16"></code></td></tr>
            <tr><td>17</td><td><code id="plaintext17"></code></td></tr>
            <tr><td>18</td><td><code id="plaintext18"></code></td></tr>
            <tr><td>19</td><td><code id="plaintext19"></code></td></tr>
            <tr><td>20</td><td><code id="plaintext20"></code></td></tr>
            <tr><td>21</td><td><code id="plaintext21"></code></td></tr>
            <tr><td>22</td><td><code id="plaintext22"></code></td></tr>
            <tr><td>23</td><td><code id="plaintext23"></code></td></tr>
            <tr><td>24</td><td><code id="plaintext24"></code></td></tr>
            <tr><td>25</td><td><code id="plaintext25"></code></td></tr>
        </table>
    </div>
</div>

<script type="text/javascript">
    function update_brute_force() {
        var text = $("#ciphertext-brute-force").val();

        for (var i = 0; i < 26; i++) {
            var ptext = "";

            for (var x = 0; x < text.length; x++) {
                var c = text.charCodeAt(x);

                if (97 <= c && c <= 122) ptext += String.fromCharCode((c-97+(26-i))%26+97);
                else if (65 <= c && c <= 90) ptext += String.fromCharCode((c-65+(26-i))%26+65);
                else ptext += String.fromCharCode(c);
            }

            $("#plaintext"+i).text(ptext);
        }
    }

    update_brute_force();
</script>

As you can see, key 17 corresponds to the ciphertext `I KNOW THE GREEKS ARE HIDDEN IN THE TROJAN HORSE`. This is an example of a **ciphertext-only attack**: all we know is the original ciphertext. This is generally the hardest type of attack to carry out.

### Known-Plaintext Attack

The astute reader will have noticed that, in fact, we do know something about the plaintext corresponding to our message, even without using brute force. The first word of the ciphertext, `Z`, is only one letter long. There are only two words in English that are one letter long: `A` and `I`. Therefore, we can greatly narrow down our search, to only the keys 17 and 25. This is an example of a (partial) **known-plaintext attack**. If we knew the whole plaintext perfectly, it would be even easier to figure out the key.

### Frequency Analysis

The Caesar cipher is a simple example of the *substitution cipher*, where we swap some letters out for other letters. A much more powerful attack on substitution ciphers is called **frequency analysis**.


<div class="panel panel-default">
    <div class="panel-heading">Caesar Cipher Brute Force</div>
    <div class="panel-body">
        <form onsubmit="return false;">
            <label for="plaintext-frequency-analysis">Plaintext</label>
            <textarea class="form-control" id="plaintext-frequency-analysis" rows="15" oninput="update_frequency_analysis();">
MARULLUS
Wherefore rejoice? What conquest brings he home?
What tributaries follow him to Rome,
To grace in captive bonds his chariot-wheels?
You blocks, you stones, you worse than senseless things!
O you hard hearts, you cruel men of Rome,
Knew you not Pompey? Many a time and oft
Have you climb'd up to walls and battlements,
To towers and windows, yea, to chimney-tops,
Your infants in your arms, and there have sat
The livelong day, with patient expectation,
To see great Pompey pass the streets of Rome:
And when you saw his chariot but appear,
Have you not made an universal shout,
That Tiber trembled underneath her banks,
To hear the replication of your sounds
Made in her concave shores?
And do you now put on your best attire?
And do you now cull out a holiday?
And do you now strew flowers in his way
That comes in triumph over Pompey's blood? Be gone!
Run to your houses, fall upon your knees,
Pray to the gods to intermit the plague
That needs must light on this ingratitude.
            </textarea>

            <br/>
        </form>

        <table class="table table-striped">
            <tr><th style="width: 10%">Letter</th><th style="width: 20%;">Count</th><th style="width: 20%;">Frequency</th><th style="width: 10%">Letter</th><th style="width: 20%;">Count</th><th style="width: 20%;">Frequency</th></tr>
            <tr><td><code id="letter0"></code></td><td id="count0"></td><td id="frequency0"></td><td><code id="letter13"></code></td><td id="count13"></td><td id="frequency13"></td></tr>
            <tr><td><code id="letter1"></code></td><td id="count1"></td><td id="frequency1"></td><td><code id="letter14"></code></td><td id="count14"></td><td id="frequency14"></td></tr>
            <tr><td><code id="letter2"></code></td><td id="count2"></td><td id="frequency2"></td><td><code id="letter15"></code></td><td id="count15"></td><td id="frequency15"></td></tr>
            <tr><td><code id="letter3"></code></td><td id="count3"></td><td id="frequency3"></td><td><code id="letter16"></code></td><td id="count16"></td><td id="frequency16"></td></tr>
            <tr><td><code id="letter4"></code></td><td id="count4"></td><td id="frequency4"></td><td><code id="letter17"></code></td><td id="count17"></td><td id="frequency17"></td></tr>
            <tr><td><code id="letter5"></code></td><td id="count5"></td><td id="frequency5"></td><td><code id="letter18"></code></td><td id="count18"></td><td id="frequency18"></td></tr>
            <tr><td><code id="letter6"></code></td><td id="count6"></td><td id="frequency6"></td><td><code id="letter19"></code></td><td id="count19"></td><td id="frequency19"></td></tr>
            <tr><td><code id="letter7"></code></td><td id="count7"></td><td id="frequency7"></td><td><code id="letter20"></code></td><td id="count20"></td><td id="frequency20"></td></tr>
            <tr><td><code id="letter8"></code></td><td id="count8"></td><td id="frequency8"></td><td><code id="letter21"></code></td><td id="count21"></td><td id="frequency21"></td></tr>
            <tr><td><code id="letter9"></code></td><td id="count9"></td><td id="frequency9"></td><td><code id="letter22"></code></td><td id="count22"></td><td id="frequency22"></td></tr>
            <tr><td><code id="letter10"></code></td><td id="count10"></td><td id="frequency10"></td><td><code id="letter23"></code></td><td id="count23"></td><td id="frequency23"></td></tr>
            <tr><td><code id="letter11"></code></td><td id="count11"></td><td id="frequency11"></td><td><code id="letter24"></code></td><td id="count24"></td><td id="frequency24"></td></tr>
            <tr><td><code id="letter12"></code></td><td id="count12"></td><td id="frequency12"></td><td><code id="letter25"></code></td><td id="count25"></td><td id="frequency25"></td></tr>
        </table>
    </div>
</div>

<script type="text/javascript">
    function update_frequency_analysis() {
        var text = $("#plaintext-frequency-analysis").val().toUpperCase();

        var counts = [];
        var total = 0;

        for (var i = 0; i < 26; i++) {
            var c = String.fromCharCode(65+i);
            var count = 0;

            for (var j = 0; j < text.length; j++) {
                if (text.charAt(j) == c) count++;
            }

            total += count;

            counts.push([c, count]);
        }

        counts.sort(function (a, b) {
            return b[1] - a[1];
        });

        for (var i = 0; i < 26; i++) {
            $("#letter"+i).text(counts[i][0]);
            $("#count"+i).text(counts[i][1]);
            $("#frequency"+i).text(Math.round(counts[i][1]/total*10000)/100+"%");
        }
    }

    update_frequency_analysis();
</script>