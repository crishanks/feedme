module AnalyticsHelper

  def entries_by_dow
    dow = {0 => "Sun", 1 => "Mon", 2 => "Tues", 3 => "Wed", 4 => "Thurs", 5 => "Fri", 6 => "Sat"}
    dt_column = "strftime('%w', DATETIME(published_datetime, '-8 hours'))"
    data = Entry.select(dt_column).group(dt_column).count
    data.transform_keys! { |k| k = dow[k.to_i] }
  end

  def entries_by_hour_of_day_pst
    dt_column = "strftime('%H', DATETIME(published_datetime, '-8 hours'))"
    data = Entry.select(dt_column).group(dt_column).count
  end

  def entries_by_minute_of_day_pst
    dt_column = "strftime('%H', DATETIME(published_datetime, '-8 hours'))"
    data = Entry.select(dt_column).group(dt_column).count
  end

  def top_five_feeds_by_entry_ct
    feed_cts = Entry.group(:feed_id).count
    feed_cts = feed_cts.sort_by { |k, v| -v }.first(5).to_h

    feed_cts.each_with_object({}) { |(k, v), n| n[Feed.find(k).title.to_sym] = v }
  end

  def self.top_five_feeds_by_entry_ct_wk
    sql = <<-SQL
      select
          title
        , avg(entries) as avg_entries_per_wk
        from
        (
          select
              f.id
            , f.title
            , count(e.id) as entries
            , strftime('%W', DATETIME(published_datetime, '-8 hours')) as woy
          from feeds f
          left join entries e on e.feed_id = f.id
          group by
              f.id
            , f.title
            , woy
        )
      group by title
      order by avg_entries_per_wk desc
      limit 5
    SQL

    result = ActiveRecord::Base.connection.execute(sql)

    new_hash = {}
    a = result.map do |h|
      h.keep_if { |k,v| k == "title" || k == "avg_entries_per_wk" }
    end

    a.map do |h|
      h.values_at("title", "avg_entries_per_wk")
    end
  end

  def top_five_feeds_by_sub
    sql = <<-SQL
      select
        f.title
      , count(fs.id)
      from feeds f
      left join feed_subscriptions fs on fs.feed_id = f.id
      group by
        1
      order by
        2 desc
      limit 5
    SQL

    result = ActiveRecord::Base.connection.execute(sql)

  end

end
