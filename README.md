## 비밀의 크롤링 

### 네이버 금융뉴스, 인베스팅 해외시세 데이터 크롤링



#### 1. Gemfile

```ruby
gem 'figaro'
gem 'httparty'
gem 'nokogiri'
```



#### 2. HTTParty, Nokogiri 사용방법

```ruby
# 크롤링 하고자 하는 접속 url
gift_url = "https://kr.investing.com/indices/indices-futures"
# HTTParty를 통해 get 접속
gift_html = HTTParty.get(gift_url)
# 접속 후 Nokogiri를 통해 내용물 저장? 이랄까
doc = Nokogiri::HTML(gift_html)
```



#### 3. 인베스팅 크롤링하기

```ruby
gift_url = "https://kr.investing.com/indices/indices-futures"
gift_html = HTTParty.get(gift_url)
doc = Nokogiri::HTML(gift_html)

# 다우존스
@dji = Array.new

# 저장된 내용물에서 css의 selector 접근으로 원하는 정보를 뽑아온다.
doc.css("#cross_rates_container").each do |djis|
  @dji << {
    title: doc.css("#pair_8873 > td.bold.left.noWrap.elp.plusIconTd > a").text,
    date: doc.css("#pair_8873 > td:nth-child(3)").text,
    current: doc.css("#pair_8873 > td.pid-8873-last").text,
    high: doc.css("#pair_8873 > td.pid-8873-high").text,
    low: doc.css("#pair_8873 > td.pid-8873-low").text,
    variance: doc.css("#pair_8873 > td.bold.pid-8873-pc").text,
    variance_per: doc.css("#pair_8873 > td.bold.pid-8873-pcp").text,
    hours: doc.css("#pair_8873 > td.pid-8873-time").text
    }
end

puts @dji.inspect

# 그리고 json 으로 파싱하여 정보 제공
render json: {dji: @dji, sp500: @sp500, nasdaq: @nasdaq, nikkei: @nikkei, ssec: @ssec, gold: @gold, wti: @wti, usdkrw: @usdkrw}
```

- json 결과

```json
{
  "dji" : [
    "title" : "title의 내용",
    	...
    	...
    "hours" : "hours의 내용"
  ]
}
```



#### 4. 뉴스 크롤링하기

```ruby
# @urlparam['code']를 통해 종목코드로 해당 종목 기사에 접속하자.
url = "http://finance.naver.com/item/news_news.nhn?code=#{@urlparam['code']}"
naver_html = HTTParty.get(url)
doc = Nokogiri::HTML(naver_html)

# 타이틀 
doc.css("body > div > table.type5 > tbody > tr > td.title > a").each do |titles|
  @titles << titles.text
end
puts @titles.inspect

# 정보제공 
doc.css("body > div > table.type5 > tbody > tr > td.info").each do |press|
  @press << press.text
end
puts @press.inspect

# 날짜 
doc.css("body > div > table.type5 > tbody > tr > td.date").each do |wdates|
  @wdate << wdates.text
end

puts @wdate.inspect
# url 
doc.css("body > div > table.type5 > tbody > tr > td.title").each do |urls|
  @url << urls.css("a")[0]['href']
end

puts @url.inspect

# article id
@article_id = Array.new

# 뉴스에서는 artice_id 와 office_id가 존재한다 !
# 이걸 뽑는 이유는 우리가 네이버 모바일의 금융뉴스로 사용자들을 보내기 위해 필요함 !

# url의 길이만큼 돌면서
@url.each do |id|
  # 31번째 자리부터 시작해 10자리를 article_id에 저장.
  @article_id << id[31,10]
end

puts @article_id

# office id
@office_id = Array.new

@url.each do |id|
  # 52번째 자리부터 3자리를 office_id에 저장.
  @office_id << id[52,3]
end
# @office_id = @url_test[31,10]

puts @office_id

# 그리고 json으로 쏘기 
render json: {title: @titles, press: @press, wdate: @wdate, url: @url, article_id: @article_id, office_id: @office_id}
```

