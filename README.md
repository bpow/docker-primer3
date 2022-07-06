# docker-primer3
(Unofficial) docker build for the [Primer3](https://github.com/primer3-org/primer3)
tool for PCR primer design.

Based on Alpine linux, with static compilation into `/opt/primer3/bin` and a 2-stage build to
keep it small. The Alpine and Primer3 versions can be set with buildargs.

It should be buildable with a simple:

```
docker build .
```
