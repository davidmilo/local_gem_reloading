Example of the setup where we have a *Rails app* and a *Gem*

Rails app is including gem as a local gem using path in the Gemfile.

How to get reloading in development work so that:
- changes in the gem are reflected in the rails app?


To test reloading, open the rails app frontpage (`Dashboard#show` action).

It render whatever `MyNamespace::MyGem.do_something` returns.

Try changing what thius method in the gem returns and reload the page. If what is rendered on the page changes then it works. If value stays same, it fails.
