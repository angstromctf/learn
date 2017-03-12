---
title: "Number Systems"
order: 1
---

Computers, at a basic level, don't communicate using letters and words like we do. Instead, they communicate and represent data using **number systems**, which is what we'll be talking about in this module.

### Binary

How are numbers represented in computers? They use a special number system called **binary**. Binary is the *base-2 number system*. What does this mean? First, let's review what a base-10 number system is.

Usually, when we count and talk about numbers, we're using base 10. Let's pick the base-10 number $$1572$$. Remember place values from elementary school math? In the case of $$1572$$, $$1$$ is in the $$1000$$'s place, $$5$$ is in the $$100$$'s place, $$7$$ is in the $$10$$'s place, and $$2$$ is in the $$1$$'s place, and we can write that $$1572 = 1 \cdot 10^3 + 5 \cdot 10^2 + 7 \cdot 10^1 + 2 \cdot 10^0$$.

When you think about binary, think about the same process, except with powers of two instead of powers of ten. Base 10 uses the digits 0 through 9, while base 2 just uses the digits 0 and 1. We usually denote binary numbers, if it's not obvious from the context that they are binary, with a subscript 2 (e.g. $$11010_2$$). Taking $$11010_2$$ as an example, we can figure out its value by using powers of two for place values: $$11010_2 = 1 \cdot 2^4 + 1 \cdot 2^3 + 0 \cdot 2^2 + 1 \cdot 2^1 + 0 \cdot 2^0 = 26_{10}$$ (the 10 subscript shows that it's decimal).

Why is binary so useful? Computers are electrical circuits, and each little circuit has two states: *on* and *off*. 0 represents off and 1 represents on. Thus, computers can transmit data by simply turning on and off electricity. Each digit in binary is called a **bit**. A collection of eight bits is called a **byte**. Ever looked a file and seen that its size is measured in GB, KB, MB, or something like that? These all indicate how many bytes long a file's data is: GB, or gigabytes, means billions of bytes, MB, or megabytes, means millions of bytes, and KB, or kilobytes, means thousands of bytes.

### Octal and Hex

As programmers, we often deal with numbers that are too large to be conveniently expressed in binary. For example, the number 100, which requires only three base 10 digits, is 1100100 (seven digits) in binary. As a result, you'll often see **hexadecimal** (most people just call it *hex*), which is base 16: it uses place values that are powers of 16. However, we only have characters for 10 digit value. How will we represent the other six? In hex, after 0 through 9, we use the letters A through F (or the corresponding lowercase letters) for the remaining six values. Thus, $$A_{16} = 10_{10}, B_{16} = 11_{10}, C_{16} = 12_{10}, D_{16} = 13_{10}, E_{16} = 14_{10}, F_{16} = 15_{10}$$. Let's do an example and attempt to convert $$AF8$$ in base 16 to base 10: $$AF8_{16} = 10 \cdot 16^2 + 15 \cdot 16^1 + 8 \cdot 16^0 = 2802_{10}$$.

Less often, you'll see octal, which is base 8. This works exactly how you'd expect it to, using places values that are powers of eight.

Conveniently, since $$16=2^4$$, each hex digit corresponds directly to four binary digits. That is to say, for example, $$3C_{16} = 00111100_2$$, since $$3_{16} = 0011_2$$ and $$C_{16} = 1100_2$$. Similarly, each octal digit corresponds to three binary digits. Most programming languages have, along with a method that converts an integer into a decimal string, methods for octal, hex, and binary, as well. For example, in Python, `hex(2802)` is `'0xaf8'` (`0x` is a prefix you'll see that denotes a hex number, along with `0b` for binary and `0o` for octal). You can also convert the other way. In Python, `int('af8', 16)` is `2802`.

### Other Bases

Sometimes, you'll see other bases in use, like base 3 or base 11. These operate on the same principle that we discussed above: base-*n* numbers use digits with place values that are powers of *n*.

Try it out!

<!-- <div class="panel panel-default">
    <div class="panel-heading">Base Conversion</div>
    <div class="panel-body">
        <form onsubmit="return false;">
            <label for="from">Original number</label>
            <div class="input-group">
                <input type="text" class="form-control" id="from" placeholder="1FA7" oninput="update_conversion();">
                <span class="input-group-addon" id="from-base">base 16</span>
            </div>

            <label>Original base</label>
            <div class="input-group">
                <label class="radio-inline">
                    <input type="radio" name="from-base-options" value="2" onclick="update_conversion();">Binary
                </label>
                <label class="radio-inline">
                    <input type="radio" name="from-base-options" value="8" onclick="update_conversion();">Octal
                </label>
                <label class="radio-inline">
                    <input type="radio" name="from-base-options" value="10" onclick="update_conversion();">Decimal
                </label>
                <label class="radio-inline">
                    <input type="radio" name="from-base-options" value="16" onclick="update_conversion();" checked>Hexadecimal
                </label>
            </div>

            <label for="to">Converted number</label>
            <div class="input-group">
                <input type="text" class="form-control" id="to" placeholder="8103" disabled>
                <span class="input-group-addon" id="to-base">base 10</span>
            </div>

            <label>Converted base</label>
            <div class="input-group">
                <label class="radio-inline">
                    <input type="radio" name="to-base-options" value="2" onclick="update_conversion();">Binary
                </label>
                <label class="radio-inline">
                    <input type="radio" name="to-base-options" value="8" onclick="update_conversion();">Octal
                </label>
                <label class="radio-inline">
                    <input type="radio" name="to-base-options" value="10" onclick="update_conversion();" checked>Decimal
                </label>
                <label class="radio-inline">
                    <input type="radio" name="to-base-options" value="16" onclick="update_conversion();">Hexadecimal
                </label>
            </div>

            <br/>
            <button class="btn btn-success" type="submit">Swap bases <span class="glyphicon glyphicon-sort" aria-hidden="true"></span></button>

            <br/><br/>
            <div class="input-group">
                <label for="conversion">Conversion math</label>
                <p id="conversion" class="form-control-static">1FA7<sub>16</sub> = 1*16<sup>3</sup> + 15*16<sup>2</sup> + 10*16<sup>1</sup> + 7*16<sup>0</sup> = 8103<sub>10</sub></p>
            </div>
        </form>
    </div>
</div> -->

<script type="text/javascript">
    var digits = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";

    function update_conversion() {
        var value = $$("#from").val();
        var base1 = parseInt($$('input[name="from-base-options"]:checked').val());
        var base2 = parseInt($$('input[name="to-base-options"]:checked').val());

        $$("#from-base").text("base " + base1);
        $$("#to-base").text("base "+ base2);

        var digits_okay = true;
        for (var i = 0; i < value.length; i++) {
            if (!digits.substr(0,base1).includes(value.charAt(i))) digits_okay = false;
        }

        if (!digits_okay) {
            $$("#conversion").html("In base " + base1 + ", only the following digits are permissible: " + digits.substr(0,base1)) + ".";
            return;
        }

        $$("#conversion").html(value + "<sub>" + base1 + "</sub> = ");

        var ival = 0;
        for (var i = 0; i < value.length; i++) {
            ival = ival * base1 + digits.indexOf(value.charAt(i));
        }

        var conv = "";
    }
</script>
