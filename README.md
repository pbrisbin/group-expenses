# Group Expenses

This is a sample Rails application for exploring some things I've been 
thinking about w.r.t. testing rails applications.

## Site features

The general idea is to allow roomates (or any group of people) to input 
shared expenses then calculate who owes whom what as reimbursements are 
made and new expenses come in.

Complexity is important to vet the concepts I'm exploring, so 
additional, ancillary features will eventually be added.

## Testing Methodology

I'm not doing anything ground-breaking here. I'm also purposely staying 
away from any discussion of design.

All I'm doing is segregating tests in a particular way. It is my belief 
that this simple reorganisation will *guide* development. It won't guide 
development down any one particular path, but it will ensure that 
development goes down *their* path in such a way that the codebase 
remains maintainable (and fun) as time goes on and complexity creeps in.

Rails has a lot to offer by way of convenience and productivity. I hope 
to find an approach that does not throw the baby out with the bathwater 
and in stead leverages The Rails Way during the times when it's useful 
but also provides enough push back to prevent you from coding yourself 
into a corner when application begins to outgrow the framework.

### Acceptance tests

Place cucumber-based acceptance tests in `features`. These tests 
should be end-to-end, happy-path smoke tests at the highest level of 
functionality. These should be *slow*.

#### When to run

* Once, overnight, by the CI server
* Must be green before any release

#### How to run

* `cucumber`
* `rake cucumber`

### Rails tests

Use normal, rails patterns for testing your `ActiveRecord` based models 
and `ActionController` based controllers in `test/unit` and 
`test/functional` respectively. These tests will be slower since they 
must boot rails and will inevitably use the database. *That's OK!*

#### When to run

* Any time you touch a framework class
* Should be green before any release

#### How to run

* `rake test`

The above is a very common approach, it's easy to just stop here. I 
think you'll find though that the Rails Tests get slower and slower and 
less and less useful. All of your logic clumps in Fat Controllers, Fat 
Models, or both.

So how do we prevent that?

### Unit tests

*PORO: Plain Old Ruby Object*

Setup vanilla rspec and a `specs` directory for true, isolated, 
honest-to-god Unit Tests of any POROs you create.

Notice I'm not telling you to create more POROs, I'm just telling you to 
have a dedicated suite for them.

These tests will always be *Fast*.

#### When to run

* Every single change
* Must be green before pushing
* Should be green before any release

#### How to run

* `rspec`

===

Why might this work?

People do what's easier, always. Rails makes it very easy to get a quick 
prototype up, full of `ActiveRecord` models doing heavy lifting for a 
bunch of rails controllers. At this stage, life is still easy. The Rails 
Test suite should still be somewhat quick and your objects won't be too 
Fat.

As the app grows into adolescence, you may find that the Rails Test 
suite is slowing, development is becoming less fun. Hopefully, by this 
time you've at least created a couple of pure domain objects and you've 
noticed that the Unit Test suite is blindingly fast.

Who would want to keep adding new features in an AR model or a 
Controller? Why would I want to have to run that slower suite when I can 
put this logic in a PORO and maintain a tight TDD loop with the 
sick-fast Unit Test suite?

Rails typically influences development to try and fit any new logic in 
either a controller or an existing AR-based model. In the beginning 
that's certainly simpler, and advised. Later on, it might appear simpler 
but is actually doing more harm than good. Eventually, you get to a 
point where you simply cannot make any changes without dealing with 
crazy interdependencies and incomprehensible God objects.

What this segregation does is create a counter-influence. Putting logic 
in separate domain classes is now *easier*. Furthermore, just how much 
easier it is will also increase with time and the complexity of your app 
-- which is exactly when we need to do it the most.
