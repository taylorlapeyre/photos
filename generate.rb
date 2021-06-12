ANALOG = [
  { url: "https://taylorlapeyre.imgix.net/22.jpg", caption: '', framing: 'landscape', title: 'Plum blossoms in early spring, Castro SF' },
  { url: "https://taylorlapeyre.imgix.net/35.jpg", caption: '', framing: 'portrait', title: 'Sam' },
  { url: "https://taylorlapeyre.imgix.net/33.jpg", caption: '', framing: 'full-bleed', title: 'Grandview Park' },
  { url: "https://taylorlapeyre.imgix.net/36.jpg", caption: '', framing: 'portrait', title: 'Dean Preston' },
  { url: "https://taylorlapeyre.imgix.net/31.jpg", caption: '', framing: 'landscape', title: 'Greenhouse in the Fort Mason Community Garden, SF' },
  { url: "https://taylorlapeyre.imgix.net/11.jpg", caption: '', framing: 'landscape', title: 'Irrigation in fort mason greenhouse' },
  { url: "https://taylorlapeyre.imgix.net/26.jpg", caption: '', framing: 'landscape', title: 'Peek' },
  { url: "https://taylorlapeyre.imgix.net/27.jpg", caption: '', framing: 'landscape', title: 'Light Blue House' },
  { url: "https://taylorlapeyre.imgix.net/24.jpg", caption: '', framing: 'landscape', title: 'Valentines day tuplips on table' },
  { url: "https://taylorlapeyre.imgix.net/29.jpg", caption: '', framing: 'landscape', title: "Sunroom near Alamo Square" },
  { url: "https://taylorlapeyre.imgix.net/2.jpg", caption: '', framing: 'portrait', title: 'The Painted Ladies of Alamo Square' },
  { url: "https://taylorlapeyre.imgix.net/20.jpg", caption: '', framing: 'full-bleed', title: 'Corona Heights' },
  { url: "https://taylorlapeyre.imgix.net/21.jpg", caption: '', framing: 'landscape', title: 'DMV' },
  { url: "https://taylorlapeyre.imgix.net/16.jpg", caption: '', framing: 'landscape', title: 'Sunset Over Cole Valley, Twin Peaks in foreground' },
  { url: "https://taylorlapeyre.imgix.net/18.jpg", caption: '', framing: 'portrait', title: 'Victorian near Buena Vista Park, SF' },
  { url: "https://taylorlapeyre.imgix.net/19.jpg", caption: '', framing: 'landscape', title: 'Illuminated MUNI street map at dusk' },
  { url: "https://taylorlapeyre.imgix.net/7.jpg", caption: '', framing: 'landscape', title: 'Nob Hill' },
  { url: "https://taylorlapeyre.imgix.net/12.jpg", caption: '', framing: 'landscape', title: 'Windows, Steiner St.' },
  { url: "https://taylorlapeyre.imgix.net/32.jpg", caption: '', framing: 'landscape', title: 'Reflection' },
  { url: "https://taylorlapeyre.imgix.net/25.jpg", caption: '', framing: 'landscape', title: 'The ecology center at Heron’s Head Park, SF' },
  { url: "https://taylorlapeyre.imgix.net/23.jpg", caption: '', framing: 'landscape', title: 'Jessie & Hiro' },
  { url: "https://taylorlapeyre.imgix.net/17.jpg", caption: '', framing: 'landscape', title: 'Cheese' },
  { url: "https://taylorlapeyre.imgix.net/34.jpg", caption: '', framing: 'landscape', title: 'Living Room Table' },
  { url: "https://taylorlapeyre.imgix.net/8.jpg", caption: '', framing: 'landscape', title: 'Fishing at Lake Merced' }
]

DIGITAL = [
  { url: "https://taylorlapeyre.imgix.net/d3.jpg", caption: '', framing: 'portrait', title: 'Jessie' },
  { url: "https://taylorlapeyre.imgix.net/d2.jpg", caption: '', framing: 'full-bleed', title: 'After Six' },
  { url: "https://taylorlapeyre.imgix.net/d1.jpg", caption: '', framing: 'portrait', title: 'Zion' },
  { url: "https://taylorlapeyre.imgix.net/d4.jpg", caption: '', framing: 'portrait', title: 'SW Corner, Joshua Tree' },
  { url: "https://taylorlapeyre.imgix.net/d5.jpg", caption: '', framing: 'full-bleed', title: 'Coot' },
  { url: "https://taylorlapeyre.imgix.net/d6.jpg", caption: '', framing: 'landscape', title: 'Hiro' },
  { url: "https://taylorlapeyre.imgix.net/d7.jpg", caption: '', framing: 'portrait', title: 'El Cap' },
  { url: "https://taylorlapeyre.imgix.net/d15.jpg", caption: '', framing: 'portrait', title: 'Jessie Shadow' },
  { url: "https://taylorlapeyre.imgix.net/d8.jpg", caption: '', framing: 'landscape', title: 'California Scrub-Jay' },
  { url: "https://taylorlapeyre.imgix.net/d9.jpg", caption: '', framing: 'landscape', title: 'Rick' },
  { url: "https://taylorlapeyre.imgix.net/d14.jpg", caption: '', framing: 'landscape', title: 'Cathedral Peak, Tuolumne' },
  { url: "https://taylorlapeyre.imgix.net/d10.jpg", caption: '', framing: 'portrait', title: 'Red-Tailed Hawk' },
  { url: "https://taylorlapeyre.imgix.net/d11.jpg", caption: '', framing: 'full-bleed', title: 'Ocean Beach' },
  { url: "https://taylorlapeyre.imgix.net/d12.jpg", caption: '', framing: 'landscape', title: 'Alamo Square in Autumn' },
  { url: "https://taylorlapeyre.imgix.net/d13.jpg", caption: '', framing: 'portrait', title: "Plumber's Crack, Red Rock" }
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