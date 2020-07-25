#!/usr/bin/env python3.7

"""
* Description *

Command timer custom status bar plugin for iTerm2. Shows how long the current
foreground job has been running.

* How to use*

Link or move this file into "~/Library/Application Support/iTerm2/Scripts/Autolaunch"
(handled by dotbot in this repo), and add the component to your status bar in
iTerm preferences.

* License text (MIT) *

Copyright 2020 Noah Moroze

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
"""

import asyncio
import iterm2
import re
import subprocess
# This script was created with the "basic" environment which does not support adding dependencies
# with pip.

async def main(connection):
    # This is an example of using an asyncio context manager to register a custom control
    # sequence. You can send a custom control sequence by issuing this command in a
    # terminal session in iTerm2 while this script is running:
    #
    # printf "\033]1337;Custom=id=%s:%s\a" "shared-secret" "create-window"
    app = await iterm2.async_get_app(connection)

    component = iterm2.StatusBarComponent(
        short_description="Command timer",
        detailed_description="Show running time of current command",
        exemplar="Running time: 5.3m",
        knobs=[],
        update_cadence=15,
        identifier="com.moroze.cmd_timer"
    )

    @iterm2.StatusBarRPC
    async def generic_command_coroutine(knobs, pid=iterm2.Reference("jobPid")):
        out = subprocess.check_output(["ps", "-o", "etime=", "-p", str(pid)])
        out = out.decode('utf-8').strip()

        re_days_hrs_mins_secs = re.compile(r"(\d*)-(\d*):(\d*):(\d*)")
        re_hrs_mins_secs = re.compile(r"(\d*):(\d*):(\d*)")
        re_mins_secs = re.compile(r"(\d*):(\d*)")

        match = re_days_hrs_mins_secs.match(out)
        if match:
            days, hrs, mins = map(int, match.group(1, 2, 3))
            return f"Running time: {days}d {hrs}h {mins}m"

        match = re_hrs_mins_secs.match(out)
        if match:
            hrs, mins = map(int, match.group(1, 2))
            return f"Running time: {hrs}h {mins}m"

        match = re_mins_secs.match(out)
        if match:
            mins, secs = map(int, match.group(1, 2))
            mins = mins + secs / 60
            return f"Running time: {mins:.1f}m"

        return "Running time: --"

    await component.async_register(connection, generic_command_coroutine)

# This instructs the script to run the "main" coroutine and to keep running even after it returns.
iterm2.run_forever(main)
