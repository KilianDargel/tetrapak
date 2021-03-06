% Copyright 2010-2011, Travelping GmbH <info@travelping.com>

% Permission is hereby granted, free of charge, to any person obtaining a
% copy of this software and associated documentation files (the "Software"),
% to deal in the Software without restriction, including without limitation
% the rights to use, copy, modify, merge, publish, distribute, sublicense,
% and/or sell copies of the Software, and to permit persons to whom the
% Software is furnished to do so, subject to the following conditions:

% The above copyright notice and this permission notice shall be included in
% all copies or substantial portions of the Software.

% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
% FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
% DEALINGS IN THE SOFTWARE.

-module(tpk).
-export([r/1, h/0, l/0, s/0, s/1, b/0, bl/0, c/0, i/2]).

r(Cmd)        -> run([Cmd]).
h()           -> run(["tetrapak:info", "tetrapak:tpk-help"]).
c()           -> r("check").
l()           -> r("tetrapak:reload").
b()           -> r("build").
bl()          -> run(["build", "tetrapak:reload"]).
s()           -> r("tetrapak:startapp").
s(App)        -> tetrapak_task_shell:start_deps(App).
i(deps, tree) -> r("info:depsastree");
i(deps, list) -> r("info:depsaslist").

run(Tasks) ->
    {ok, Cwd} = file:get_cwd(),
    tetrapak:run(Cwd, Tasks).
