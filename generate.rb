ANALOG = [
  { url: "https://taylorlapeyre.imgix.net/46.jpg", caption: '', framing: 'landscape', title: 'Bus stop in Mendocino' },
  { url: "https://taylorlapeyre.imgix.net/42.jpg", caption: '', framing: 'portrait', title: 'Prayer flags' },
  { url: "https://taylorlapeyre.imgix.net/20.jpg", caption: '', framing: 'landscape', title: 'Corona Heights' },
  { url: "https://taylorlapeyre.imgix.net/43.jpg", caption: '', framing: 'landscape', title: 'Yellow Bernal house' },
  { url: "https://taylorlapeyre.imgix.net/34.jpg", caption: '', framing: 'landscape', title: 'Living Room Table' },
  { url: "https://taylorlapeyre.imgix.net/29.jpg", caption: '', framing: 'landscape', title: "Sunroom near Alamo Square" },
  { url: "https://taylorlapeyre.imgix.net/22.jpg", caption: '', framing: 'landscape', title: 'Plum blossoms' },
  { url: "https://taylorlapeyre.imgix.net/16.jpg", caption: '', framing: 'landscape', title: 'Sunset Over Cole Valley, Twin Peaks in foreground' },
  { url: "https://taylorlapeyre.imgix.net/21.jpg", caption: '', framing: 'landscape', title: 'DMV' },
  { url: "https://taylorlapeyre.imgix.net/7.jpg", caption: '', framing: 'landscape', title: 'Nob Hill' },
  { url: "https://taylorlapeyre.imgix.net/12.jpg", caption: '', framing: 'landscape', title: 'Windows, Steiner St.' },
  { url: "https://taylorlapeyre.imgix.net/26.jpg", caption: '', framing: 'landscape', title: 'Peek' },
  { url: "https://taylorlapeyre.imgix.net/36.jpg", caption: '', framing: 'portrait', title: 'Alamo Square pastels' },
  { url: "https://taylorlapeyre.imgix.net/45.jpg", caption: '', framing: 'landscape', title: 'Pink flowers' },
]

DIGITAL = [
  { url: "https://taylorlapeyre.imgix.net/d19.jpg", caption: '', framing: 'portrait', title: 'Reader at Alamo' },
  { url: "https://taylorlapeyre.imgix.net/d3.jpg", caption: '', framing: 'portrait', title: 'Jessie' },
  { url: "https://taylorlapeyre.imgix.net/d1.jpg", caption: '', framing: 'portrait', title: 'Zion' },
  { url: "https://taylorlapeyre.imgix.net/d2.jpg", caption: '', framing: 'full-bleed', title: 'After Six' },
  { url: "https://taylorlapeyre.imgix.net/d4.jpg", caption: '', framing: 'portrait', title: 'SW Corner, Joshua Tree' },
  { url: "https://taylorlapeyre.imgix.net/d7.jpg", caption: '', framing: 'portrait', title: 'El Cap' },
  { url: "https://taylorlapeyre.imgix.net/d14.jpg", caption: '', framing: 'landscape', title: 'Cathedral Peak, Tuolumne' },
  { url: "https://taylorlapeyre.imgix.net/d17.jpg", caption: '', framing: 'landscape', title: 'Reader at Corona Heights' },
  { url: "https://taylorlapeyre.imgix.net/d16.jpg", caption: '', framing: 'full-bleed', title: 'Hawk' },
  { url: "https://taylorlapeyre.imgix.net/d18.jpg", caption: '', framing: 'landscape', title: 'Pacifc-slope Flycatcher' },
  { url: "https://taylorlapeyre.imgix.net/d10.jpg", caption: '', framing: 'portrait', title: 'Red-Tailed Hawk' },
  { url: "https://taylorlapeyre.imgix.net/d8.jpg", caption: '', framing: 'landscape', title: 'California Scrub-Jay' },
  { url: "https://taylorlapeyre.imgix.net/d6.jpg", caption: '', framing: 'landscape', title: 'Hiro' },
  { url: "https://taylorlapeyre.imgix.net/d5.jpg", caption: '', framing: 'landscape', title: 'Coot' },
  { url: "https://taylorlapeyre.imgix.net/d11.jpg", caption: '', framing: 'full-bleed', title: 'Ocean Beach' },
  { url: "https://taylorlapeyre.imgix.net/d15.jpg", caption: '', framing: 'portrait', title: 'Jessie Shadow' },
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
  .gsub(/<section id="analog" class="tab-content page-container">(.?|\n)*?<\/section>/, %Q{
    <section id="analog" class="tab-content page-container">
      #{ANALOG.map { |image| generate_image_tag(image) }.join('')}
    </section>
  })
  .gsub(/<section id="digital" class="tab-content page-container">(.?|\n)*?<\/section>/, %Q{
    <section id="digital" class="tab-content page-container">
      #{DIGITAL.map { |image| generate_image_tag(image) }.join('')}
    </section>
  })

File.write('index.html', generated_index)