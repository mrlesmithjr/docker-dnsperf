Repo Info
=========
A [Docker] image for DNS performance testing using [DNSPerf].

Includes the [queryfile-example-current] which contains example DNS records to
query...

Options
-------
To view the `dnsperf` options
```
docker run -it mrlesmithjr/dnsperf dnsperf -h
```
```
DNS Performance Testing Tool
Nominum Version 2.1.0.0

Usage: dnsperf [-f family] [-s server_addr] [-p port] [-a local_addr]
               [-x local_port] [-d datafile] [-c clients] [-T threads]
               [-n maxruns] [-l timelimit] [-b buffer_size] [-t timeout]
               [-e] [-D] [-y [alg:]name:secret] [-q num_queries]
               [-Q max_qps] [-S stats_interval] [-u] [-v] [-h]
  -f address family of DNS transport, inet or inet6 (default: any)
  -s the server to query (default: 127.0.0.1)
  -p the port on which to query the server (default: 53)
  -a the local address from which to send queries
  -x the local port from which to send queries (default: 0)
  -d the input data file (default: stdin)
  -c the number of clients to act as
  -T the number of threads to run
  -n run through input at most N times
  -l run for at most this many seconds
  -b socket send/receive buffer size in kilobytes
  -t the timeout for query completion in seconds (default: 5)
  -e enable EDNS 0
  -D set the DNSSEC OK bit (implies EDNS)
  -y the TSIG algorithm, name and secret
  -q the maximum number of queries outstanding (default: 100)
  -Q limit the number of queries per second
  -S print qps statistics every N seconds
  -u send dynamic updates instead of queries
  -v verbose: report each query to stdout
  -h print this help
```

Examples
--------
Simple test:
```
docker run -it mrlesmithjr/dnsperf dnsperf -d /queryfile-example-current -s 10.0.101.178
```
Act as 30 clients:
```
docker run -it mrlesmithjr/dnsperf dnsperf -d /queryfile-example-current -s 10.0.101.178 -c 30 -v
```
Act as 30 clients over 30 seconds with 60 queries a second:
```
docker run -it mrlesmithjr/dnsperf dnsperf -d /queryfile-example-current -s 10.0.101.178 -l 30 -c 30 -Q 60 -v
```
```
[Status] Testing complete (interruption)

Statistics:

  Queries sent:         2538
  Queries completed:    2438 (96.06%)
  Queries lost:         1 (0.04%)
  Queries interrupted:  99 (3.90%)

  Response codes:       NOERROR 1971 (80.84%), SERVFAIL 19 (0.78%), NXDOMAIN 448 (18.38%)
  Average packet size:  request 38, response 102
  Run time (s):         6.729156
  Queries per second:   362.303980

  Average Latency (s):  0.247463 (min 0.001710, max 4.330588)
  Latency StdDev (s):   0.371711
```

License
-------

BSD

Author Information
------------------

Larry Smith Jr.
- [@mrlesmithjr]
- [everythingshouldbevirtual.com]
- [mrlesmithjr@gmail.com]

[DNSPerf]: <http://nominum.com/measurement-tools/>
[Docker]: <https://www.docker.com>
[queryfile-example-current]: <ftp://ftp.nominum.com/pub/nominum/dnsperf/data/queryfile-example-current.gz>
[@mrlesmithjr]: <https://twitter.com/mrlesmithjr>
[everythingshouldbevirtual.com]: <http://everythingshouldbevirtual.com>
[mrlesmithjr@gmail.com]: <mailto:mrlesmithjr@gmail.com>
