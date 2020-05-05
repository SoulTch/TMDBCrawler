TMDB Simple App

0. Requirement
<pre>
<code>
cd crawler
export APIKEY=[your api key]
</code>
</pre>

1. Crawl all
<pre>
<code>
rails runner crawl.rb
</code>
</pre>

2. Crawl all movie/person/tv
<pre>
<code>
rails runner crawl_[target].rb
</code>
</pre>

3. Crawl specific movie/person/tv
<pre>
<code>
rails runner crawl_[target].rb [id]
</code>
</pre>

4. Update differencies for movie/person/tv
<pre>
<code>
rails runner crawl_[target].rb update
</code>
</pre>
