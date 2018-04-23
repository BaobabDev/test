class InvestingController < ApplicationController
  require 'httparty'
  require 'nokogiri'
  
  def index

    gift_url = "https://kr.investing.com/indices/indices-futures"
    gift_html = HTTParty.get(gift_url)
    doc = Nokogiri::HTML(gift_html)
    
    # 다우존스
    @dji = Array.new
    
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
    
    @sp500 = Array.new
    
    doc.css("#cross_rates_container").each do |djis|
      @sp500 << {
        title: doc.css("#pair_8839 > td.bold.left.noWrap.elp.plusIconTd > a").text,
        date: doc.css("#pair_8839 > td:nth-child(3)").text,
        current: doc.css("#pair_8839 > td.pid-8839-last").text,
        high: doc.css("#pair_8839 > td.pid-8839-high").text,
        low: doc.css("#pair_8839 > td.pid-8839-low").text,
        variance: doc.css("#pair_8839 > td.bold.pid-8839-pc").text,
        variance_per: doc.css("#pair_8839 > td.bold.pid-8839-pcp").text,
        hours: doc.css("#pair_8839 > td.pid-8839-time").text
      }
    end 
    puts @sp500.inspect
    
    @nasdaq = Array.new
    
    doc.css("#cross_rates_container").each do |djis|
      @nasdaq << {
        title: doc.css("#pair_8874 > td.bold.left.noWrap.elp.plusIconTd > a").text,
        date: doc.css("#pair_8874 > td:nth-child(3)").text,
        current: doc.css("#pair_8874 > td.pid-8874-last").text,
        high: doc.css("#pair_8874 > td.pid-8874-high").text,
        low: doc.css("#pair_8874 > td.pid-8874-low").text,
        variance: doc.css("#pair_8874 > td.bold.pid-8874-pc").text,
        variance_per: doc.css("#pair_8874 > td.bold.pid-8874-pcp").text,
        hours: doc.css("#pair_8874 > td.pid-8874-time").text
      }
    end 
    
    puts @nasdaq.inspect
    
    major_url = "https://kr.investing.com/indices/major-indices"
    major_html = HTTParty.get(major_url)
    doc = Nokogiri::HTML(major_html)
    
    @nikkei = Array.new
    
    doc.css("#cross_rates_container").each do |djis|
      @nikkei << {
        title: doc.css("#pair_178 > td.bold.left.noWrap.elp.plusIconTd > a").text,
        current: doc.css("#pair_178 > td.pid-178-last").text,
        high: doc.css("#pair_178 > td.pid-178-high").text,
        low: doc.css("#pair_178 > td.pid-178-low").text,
        variance: doc.css("#pair_178 > td.bold.pid-178-pc").text,
        variance_per: doc.css("#pair_178 > td.bold.pid-178-pcp").text,
        hours: doc.css("#pair_178 > td.pid-178-time").text
      }
    end 

    puts @nikkei.inspect
    
    @ssec = Array.new
    
    doc.css("#cross_rates_container").each do |djis|
      @ssec << {
        title: doc.css("#pair_40820 > td.bold.left.noWrap.elp.plusIconTd > a").text,
        current: doc.css("#pair_40820 > td.pid-40820-last").text,
        high: doc.css("#pair_40820 > td.pid-40820-high").text,
        low: doc.css("#pair_40820 > td.pid-40820-low").text,
        variance: doc.css("#pair_40820 > td.bold.pid-40820-pc").text,
        variance_per: doc.css("#pair_40820 > td.bold.pid-40820-pcp").text,
        hours: doc.css("#pair_40820 > td.pid-40820-time").text
      }
    end 

    puts @ssec.inspect
    
    futures_url = "https://kr.investing.com/commodities/real-time-futures"
    futures_html = HTTParty.get(futures_url)
    doc = Nokogiri::HTML(futures_html)
    
    @gold = Array.new
    
    doc.css("#cross_rates_container").each do |djis|
      @gold << {
        title: doc.css("#cross_rate_1 > tbody > tr:nth-child(1) > td.bold.left.plusIconTd.noWrap.elp").text,
        date: doc.css("#cross_rate_1 >tbody > tr:nth-child(1) > td:nth-child(3)").text,
        current: doc.css("#cross_rate_1 >tbody > tr:nth-child(1) > td.pid-8830-last").text,
        high: doc.css("#cross_rate_1 >tbody > tr:nth-child(1) > td.pid-8830-high").text,
        low: doc.css("#cross_rate_1 >tbody > tr:nth-child(1) > td.pid-8830-low").text,
        variance: doc.css("#cross_rate_1 >tbody > tr:nth-child(1) > td.bold.pid-8830-pc").text,
       variance_per: doc.css("#cross_rate_1 >tbody > tr:nth-child(1) > td.bold.pid-8830-pcp").text,
        hours: doc.css("#cross_rate_1 >tbody > tr:nth-child(1) > td.pid-8830-time").text
      }
    end 

    puts @gold.inspect    
    
    @wti = Array.new
    
    doc.css("#cross_rates_container").each do |djis|
      @wti << {
        title: doc.css("#cross_rate_1 > tbody > tr:nth-child(7) > td.bold.left.plusIconTd.noWrap.elp").text,
        date: doc.css("#cross_rate_1 >tbody > tr:nth-child(7) > td:nth-child(3)").text,
        current: doc.css("#cross_rate_1 >tbody > tr:nth-child(7) > td.pid-8849-last").text,
        high: doc.css("#cross_rate_1 >tbody > tr:nth-child(7) > td.pid-8849-high").text,
        low: doc.css("#cross_rate_1 >tbody > tr:nth-child(7) > td.pid-8849-low").text,
        variance: doc.css("#cross_rate_1 >tbody > tr:nth-child(7) > td.bold.pid-8849-pc").text,
        variance_per: doc.css("#cross_rate_1 >tbody > tr:nth-child(7) > td.bold.pid-8849-pcp").text,
        hours: doc.css("#cross_rate_1 >tbody > tr:nth-child(7) > td.pid-8849-time").text
      }
    end 

    puts @wti.inspect   
    
    currencies_url = "https://kr.investing.com/currencies/"
    currencies_html = HTTParty.get(currencies_url)
    doc = Nokogiri::HTML(currencies_html)
    
    @usdkrw = Array.new
    
    doc.css("#cr1").each do |djis|
      @usdkrw << {
        title: doc.css("#pair_650 > td.bold.left.noWrap.elp.plusIconTd > a").text,
        date: doc.css("#pair_650 > td:nth-child(3)").text,
        current: doc.css("#pair_650 > td.pid-650-last").text,
        high: doc.css("#pair_650 > td.pid-650-high").text,
        low: doc.css("#pair_650 > td.pid-650-low").text,
        variance: doc.css("#pair_650 > td.bold.pid-650-pc").text,
        variance_per: doc.css("#pair_650 > td.bold.pid-650-pcp").text,
        hours: doc.css("#pair_650 > td.pid-650-time").text
      }
    end 

    puts @usdkrw.inspect
    
    render json: {dji: @dji, sp500: @sp500, nasdaq: @nasdaq, nikkei: @nikkei, ssec: @ssec, gold: @gold, wti: @wti, usdkrw: @usdkrw}
  end
  
  def view
  end

  def newscrawling
    # @article = Hash.new
    
    @titles = Array.new
    @press = Array.new
    @wdate = Array.new
    @url = Array.new
      
    
    # 차후 companycode 파라미터를 통해 여러 기업의 기사를 긁어옴
    # companycode = request.original_url.split("companycode=").last
    # puts companycode
    
    @urlparam = request.query_parameters
    
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
    
    @url.each do |id|
      @article_id << id[31,10]
    end
    
    puts @article_id
    
    # office id
    @office_id = Array.new
    
    @url.each do |id|
      @office_id << id[52,3]
    end
    # @office_id = @url_test[31,10]
    
    puts @office_id
    
    render json: {title: @titles, press: @press, wdate: @wdate, url: @url, article_id: @article_id, office_id: @office_id}
  end

  def korea
    korea_url = "https://kr.investing.com/indices/south-korea-indices"
    korea_html = HTTParty.get(korea_url)
    doc = Nokogiri::HTML(korea_html)
    
    @kospi = Array.new
    
    doc.css("#cr1").each do |djis|
      @kospi << {
        title: doc.css("#pair_37426 > td.bold.left.noWrap.elp.plusIconTd > a").text,
        current: doc.css("#pair_37426 > td.pid-37426-last").text,
        high: doc.css("#pair_37426 > td.pid-37426-high").text,
        low: doc.css("#pair_37426 > td.pid-37426-low").text,
        variance: doc.css("#pair_37426 > td.bold.pid-37426-pc").text,
        variance_per: doc.css("#pair_37426 > td.bold.pid-37426-pcp").text,
        hours: doc.css("#pair_37426 > td.pid-37426-time").text
      }
    end
    
    puts @kospi
    
    @kosdaq = Array.new
    
    doc.css("#cr1").each do |djis|
      @kosdaq << {
        title: doc.css("#pair_38016 > td.bold.left.noWrap.elp.plusIconTd > a").text,
        current: doc.css("#pair_38016 > td.pid-38016-last").text,
        high: doc.css("#pair_38016 > td.pid-38016-high").text,
        low: doc.css("#pair_38016 > td.pid-38016-low").text,
        variance: doc.css("#pair_38016 > td.pid-38016-low").text,
        variance_per: doc.css("#pair_38016 > td.bold.pid-38016-pcp").text,
        hours: doc.css("#pair_38016 > td.pid-38016-time").text
      }
    end
    
    puts @kosdaq
    
    render json: {kospi: @kospi, kosdaq: @kosdaq}
  end
end
