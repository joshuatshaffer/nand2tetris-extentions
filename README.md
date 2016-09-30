# nand2tetris-extentions
I came up with this Bash script that allows me test my chips very quickly from the command line. I made it for a Unix style system (OS X and Linux) but it might work on Windows if you use Putty.

This repo has several redundant versions:
<ul>
<li><b>test-all</b> is the recommended version.</li>
<li><b>test-all-monochrome</b> is the same as test-all except  that it does not colorize its output. Use this if your terminal does not support ANSI color codes.</li>
<li><b>test-all-simple</b> is the original and simplest version. It does the same job as test-all but it does not format its output.</li>
<li><b>test-all-OSX.command</b> is the same as test-all except that it can be run by double clicking it in Finder. This one needs to be installed differently (see below.)
</li>
</ul>

# Install and Use
<h3>test-all, test-all-monochrome, and test-all-simple</h3>
<ol>
<li>Save the script in your projects folder.</li>
<li>Make sure it's executable. <pre><code>chmod +x test-all</code></pre></li>
<li>cd into the project you want to test.</li>
<li>Run it by typing <pre><code>../test-all</code></pre></li>
</ol>
It should print something like 
<pre><code>Testing RAM8 ... pass
Testing Register ... pass
Testing RightArithmeticBitshift ... pass
All tests passed!</code></pre>
on your terminal.

<h3>test-all-OSX.command</h3>
<ol>
<li>Save test-all-OSX.command into the same folder as your chips.</li>
<li>Run it by double clicking it in Finder.</li>
</ol>
A terminal window should open and display the same output as test-all.

<h3>Command line with no script file.</h3>
This is the same as test-all-simple.
<ol>
<li>cd into the project you want to test</li>
<li>Copy/paste this into the command line. <pre><code>for i in *.tst; do echo "Testing $i ..."; ../../tools/HardwareSimulator.sh $i; done</code></pre> </li>
</ol>
