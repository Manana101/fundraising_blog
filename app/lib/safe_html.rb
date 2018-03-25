class SafeHtml
  def self.relaxed(html)
    Sanitize.fragment(html, Sanitize::Config.merge(Sanitize::Config::RELAXED,
      :attributes => Sanitize::Config.merge(Sanitize::Config::RELAXED[:attributes], {
        'a' => %w[href hreflang name rel target]
      })
    ))
  end
end
