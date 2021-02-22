ANALOG = [
  { url: "https://taylorlapeyre.imgix.net/22.jpg", caption: '35mm Lomography 800', framing: 'landscape', title: 'Cherry Blossoms' },
  { url: "https://taylorlapeyre.imgix.net/2.jpg", caption: '35mm Kodak Colorplus 200', framing: 'portrait', title: 'Painted Ladies' },
  { url: "https://taylorlapeyre.imgix.net/3.jpg", caption: '35mm Kodak Colorplus 200', framing: 'full-bleed', title: "Lover's Lane" },
  { url: "https://taylorlapeyre.imgix.net/19.jpg", caption: '35mm Lomography 800', framing: 'landscape', title: 'Illuminated Map' },
  { url: "https://taylorlapeyre.imgix.net/7.jpg", caption: '35mm Kodak Ektar 100', framing: 'landscape', title: 'Nob Hill' },
  { url: "https://taylorlapeyre.imgix.net/21.jpg", caption: '35mm Lomography 800', framing: 'landscape', title: 'DMV' },
  { url: "https://taylorlapeyre.imgix.net/15.jpg", caption: '35mm Kodak Colorplus 200', framing: 'landscape', title: 'Twin Peaks' },
  { url: "https://taylorlapeyre.imgix.net/16.jpg", caption: '35mm Lomography 800', framing: 'full-bleed', title: 'Sunset Over Cole Valley' },
  { url: "https://taylorlapeyre.imgix.net/12.jpg", caption: '35mm Kodak Colorplus 200', framing: 'landscape', title: 'Windows, Steiner St.' },
  { url: "https://taylorlapeyre.imgix.net/23.jpg", caption: '35mm Portra 400', framing: 'landscape', title: 'Jessie & Hiro' },
  { url: "https://taylorlapeyre.imgix.net/6.jpg", caption: '35mm Kodak Colorplus 200', framing: 'landscape', title: 'Alamo Square Sunset' },
  { url: "https://taylorlapeyre.imgix.net/1.jpg", caption: '35mm Kodak Portra 800', framing: 'landscape', title: 'Montata Manzanita' },
  { url: "https://taylorlapeyre.imgix.net/4.jpg", caption: '35mm Kodak Portra 400', framing: 'portrait', title: 'Panhandle' },
  { url: "https://taylorlapeyre.imgix.net/20.jpg", caption: '35mm Lomography 800', framing: 'full-bleed', title: 'Corona Heights' },
  { url: "https://taylorlapeyre.imgix.net/5.jpg", caption: '35mm Kodak Portra 400', framing: 'portrait', title: 'Jessie' },
  { url: "https://taylorlapeyre.imgix.net/8.jpg", caption: '35mm Kodak Ektar 100', framing: 'landscape', title: 'Fishing at Lake Merced' },
  { url: "https://taylorlapeyre.imgix.net/9.jpg", caption: '35mm Kodak Portra 400', framing: 'landscape', title: 'Buried Manzanita' },
  { url: "https://taylorlapeyre.imgix.net/10.jpg", caption: '35mm Kodak Portra 400', framing: 'full-bleed', title: 'Mt. Diablo' },
  { url: "https://taylorlapeyre.imgix.net/11.jpg", caption: '35mm Kodak Portra 800', framing: 'landscape', title: 'Irrigation' },
  { url: "https://taylorlapeyre.imgix.net/14.jpg", caption: '35mm Kodak Colorplus 200', framing: 'landscape', title: 'Skating on MUNI' },
  { url: "https://taylorlapeyre.imgix.net/17.jpg", caption: '35mm Lomography 800', framing: 'landscape', title: 'Cheese' },
  { url: "https://taylorlapeyre.imgix.net/18.jpg", caption: '35mm Lomography 800', framing: 'portrait', title: 'Victorian' }
]

DIGITAL = [
  { url: "https://taylorlapeyre.imgix.net/d3.jpg", caption: 'iPhone 7', framing: 'portrait', title: 'Jessie' },
  { url: "https://taylorlapeyre.imgix.net/d2.jpg", caption: 'Sony α5100', framing: 'landscape', title: 'After Six' },
  { url: "https://taylorlapeyre.imgix.net/d1.jpg", caption: 'iPhone 7', framing: 'portrait', title: 'Zion' },
  { url: "https://taylorlapeyre.imgix.net/d4.jpg", caption: 'Sony α5100', framing: 'portrait', title: 'SW Corner, Joshua Tree' },
  { url: "https://taylorlapeyre.imgix.net/d5.jpg", caption: 'Sony α7III', framing: 'full-bleed', title: 'Coot' },
  { url: "https://taylorlapeyre.imgix.net/d6.jpg", caption: 'Sony α7III', framing: 'landscape', title: 'Hiro' },
  { url: "https://taylorlapeyre.imgix.net/d7.jpg", caption: 'iPhone X', framing: 'portrait', title: 'El Cap' },
  { url: "https://taylorlapeyre.imgix.net/d8.jpg", caption: 'Sony α7III', framing: 'landscape', title: 'California Scrub-Jay' },
  { url: "https://taylorlapeyre.imgix.net/d9.jpg", caption: 'Sony α5100', framing: 'landscape', title: 'Rick' },
  { url: "https://taylorlapeyre.imgix.net/d14.jpg", caption: 'iPhone 7', framing: 'landscape', title: 'Cathedral Peak, Tuolumne' },
  { url: "https://taylorlapeyre.imgix.net/d10.jpg", caption: 'Sony α7III', framing: 'portrait', title: 'Red-Tailed Hawk' },
  { url: "https://taylorlapeyre.imgix.net/d11.jpg", caption: 'Sony α7III', framing: 'full-bleed', title: 'Ocean Beach' },
  { url: "https://taylorlapeyre.imgix.net/d12.jpg", caption: 'Sony α5100', framing: 'landscape', title: 'Alamo Square in Autumn' },
  { url: "https://taylorlapeyre.imgix.net/d13.jpg", caption: 'iPhone X', framing: 'portrait', title: "Plumber's Crack, Red Rock" }
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