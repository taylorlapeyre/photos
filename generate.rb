PORTFOLIO = [
  { url: "photos/d2.jpg", caption: '', framing: 'full-bleed', title: 'After Six' },
  { url: "photos/d14.jpg", caption: '', framing: 'landscape', title: 'Cathedral Peak, Tuolumne' },
  { url: "photos/d10.jpg", caption: '', framing: 'portrait', title: 'Red-Tailed Hawk' },
  { url: "photos/46.jpg", caption: '', framing: 'landscape', title: 'Bus stop in Mendocino' },
  { url: "photos/42.jpg", caption: '', framing: 'portrait', title: 'Prayer flags' },
  { url: "photos/49.jpg", caption: '', framing: 'portrait', title: 'KD Court' },
  { url: "photos/d16.jpg", caption: '', framing: 'full-bleed', title: 'Hawk' },
  { url: "photos/d7.jpg", caption: '', framing: 'portrait', title: 'El Cap' },
  { url: "photos/20.jpg", caption: '', framing: 'landscape', title: 'Corona Heights' },
  { url: "photos/43.jpg", caption: '', framing: 'landscape', title: 'Yellow Bernal house' },
  { url: "photos/41.jpg", caption: '', framing: 'landscape', title: 'Hio & Jessie Portrait' },
  { url: "photos/34.jpg", caption: '', framing: 'landscape', title: 'Living Room Table' },
  { url: "photos/d4.jpg", caption: '', framing: 'portrait', title: 'SW Corner, Joshua Tree' },
  { url: "photos/d17.jpg", caption: '', framing: 'landscape', title: 'Reader at Corona Heights' },
  { url: "photos/29.jpg", caption: '', framing: 'landscape', title: "Sunroom near Alamo Square" },
  { url: "photos/22.jpg", caption: '', framing: 'landscape', title: 'Plum blossoms' },
  { url: "photos/28.jpg", caption: '', framing: 'landscape', title: "Roofs by Grandview" },
  { url: "photos/d3.jpg", caption: '', framing: 'portrait', title: 'Jessie' },
  { url: "photos/d1.jpg", caption: '', framing: 'portrait', title: 'Zion' },
  { url: "photos/16.jpg", caption: '', framing: 'landscape', title: 'Sunset Over Cole Valley, Twin Peaks in foreground' },
  { url: "photos/21.jpg", caption: '', framing: 'landscape', title: 'DMV' },
  { url: "photos/48.jpg", caption: '', framing: 'portrait', title: 'SFFD' },
  { url: "photos/7.jpg", caption: '', framing: 'landscape', title: 'Nob Hill' },
  { url: "photos/12.jpg", caption: '', framing: 'landscape', title: 'Windows, Steiner St.' },
  { url: "photos/d6.jpg", caption: '', framing: 'landscape', title: 'Hiro' },
  { url: "photos/26.jpg", caption: '', framing: 'landscape', title: 'Peek' },
  { url: "photos/d19.jpg", caption: '', framing: 'portrait', title: 'Reader at Alamo' },
  { url: "photos/36.jpg", caption: '', framing: 'portrait', title: 'Alamo Square pastels' },
]

# DIGITAL = [
#   { url: "photos/d19.jpg", caption: '', framing: 'portrait', title: 'Reader at Alamo' },
#   { url: "photos/d18.jpg", caption: '', framing: 'landscape', title: 'Pacifc-slope Flycatcher' },
#   { url: "photos/d8.jpg", caption: '', framing: 'landscape', title: 'California Scrub-Jay' },
#   { url: "photos/d5.jpg", caption: '', framing: 'landscape', title: 'Coot' },
#   { url: "photos/d11.jpg", caption: '', framing: 'full-bleed', title: 'Ocean Beach' },
#   { url: "photos/d15.jpg", caption: '', framing: 'portrait', title: 'Jessie Shadow' },
# ]

BLACK_AND_WHITE = [
  { url: "photos/bw1.jpg", caption: '', framing: 'landscape', title: 'Laundry' },
  { url: "photos/bw2.jpg", caption: '', framing: 'landscape', title: 'Steiner building' },
  { url: "photos/bw3.jpg", caption: '', framing: 'landscape', title: 'Jouer et Nuit' },
  { url: "photos/bw4.jpg", caption: '', framing: 'landscape', title: 'Alamo Cypress' },
  { url: "photos/bw5.jpg", caption: '', framing: 'landscape', title: 'Alamo Sillouette' },
]

def generate_image_tag(image)
  widths = {
    'landscape' => [1400, 700],
    'full-bleed' => [2000, 800],
    'portrait' => [1000, 600]
  }

  classes = {
    'landscape' => '',
    'full-bleed' => 'full-bleed',
    'portrait' => 'vertical'
  }

  widths_for_image = widths[image[:framing]]
  class_for_image = classes[image[:framing]]

  %Q{
    <figure class="#{class_for_image} photo-container">
      <picture>
        <source
          media="(min-width: 992px)"
          srcset="#{image[:url]}?w=#{widths_for_image[0]}"
        />
        <source
          media="(max-width: 992px)"
          srcset="#{image[:url]}?w=#{widths_for_image[1]}"
        />
        <img
          alt="#{image[:title]}"
          class="photo"
          loading="lazy"
          src="#{image[:url]}"
        />
      </picture>
      <figcaption class="photo-caption">
        #{image[:caption]}
      </figcaption>
    </figure>
  }

end

index = File.read('index.template.html')

generated_index =
  index
  .gsub(/<section id="portfolio" class="tab-content page-container">(.?|\n)*?<\/section>/, %Q{
    <section id="portfolio" class="tab-content page-container">
      #{(PORTFOLIO + BLACK_AND_WHITE).map { |image| generate_image_tag(image) }.join('')}
    </section>
  })

File.write('index.html', generated_index)
