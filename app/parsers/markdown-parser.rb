require 'redcarpet'

# TODO: buradan asagidaki fonksiyonlar standartlar belirlenerek duzenlenecek
# TODO: ic ice döngüler sırasında parse işlemi sorun vermekte. Düzeltilmesi gerekiyor

# öyak çeviri yönetim sistemi için kullanılabilecek standartlarda render
class OyakRender < Redcarpet::Render::HTML
  # header tagları icin
  def header(text, header_level)
    %(<header#{header_level}>#{text}</header#{header_level}>)
  end

  # paragraf olarak adlandırılan düz yazıların ayar kısmı
  def paragraph(text)
    %(<text>#{text}</text>)
  end

  def block_quote(quote)
    %(<blockquote>#{quote}</blockquote>)
  end

  def footnotes(content)
    %(<footnotes>#{content}</footnotes>)
  end

  # list name not working yet
  def list(contents, _list_type)
    "<list>#{contents}</list>"
  end

  def list_item(text, _list_type)
    "<list_item>#{text}</list_item>"
  end

  # table name not working yet
  def table(header, body)
    "<table>#{header}</table> #{body}"
  end

  def table_row(content)
    "<tableRow>#{content}</tableRow>"
  end

  def table_cell(content, alignment)
    "<tableCell>#{alignment} #{content}</tableCell>"
  end

  def image(_link, title, _alt_text)
    %(<resim>[resim: #{title}]</resim>)
  end

  def link(_link, title, _content)
    %(<link>#{title}</link>)
  end

  def raw_html(_raw_html)
    %(raw_tml)
  end

  def linebreak
    "\n"
  end

  def triple_emphasis(text)
    text
  end

  def strikethrough(text)
    text
  end

  def superscript(text)
    text
  end

  def underline(text)
    text
  end

  def highlight(text)
    text
  end

  def quote(text)
    text
  end

  def footnote_ref(number)
    number
  end

  def emphasis(text)
    text
  end

  def double_emphasis(text)
    text
  end

  def autolink(link, _link_type)
    link
  end

  def codespan(code)
    code
  end
end

# basit bir makaleyi parcalayıp kullanılabilir dizi haline getirir
class MarkdownParser
  # verilen markdown stringini diziye parcalar
  def self.parse2arr(markdown_string, options = {}, render = OyakRender)
    md = Redcarpet::Markdown.new(render, options)
    result_html = md.render(markdown_string)
    result = result_html.split(/<\/[^>]*>/)
    result.inject([]) { |arr, v| arr << v.scan(/<([^>]*)>(.*)/).first }
  end
end

# example usage
if __FILE__ == $PROGRAM_NAME
  # tablolar icin
  # 'tables: true' eklenmeli
  options = {}

  markdown_string = <<-MARKDOWN_ARTICLE
# Header1 örneği
düz yazı örneği.
## Header2 örneği
düz yazı örneği.
### Header3 Örneği
ama tabii olarak kalın ve eğik yazıların **tartışılması** _başka_ bir konudur
#### Header4 Örneği
olmasına olsa dahi yine de değişikliğe ihtiyac var
##### Header5 Örneği
hala ic başlıklar
###### Header6 Örneği
ve sonuc texti
MARKDOWN_ARTICLE

  p MarkdownParser.parse2arr(markdown_string, options)
end

=begin
Basit düzeyde markdown parse işlemi yapılarak karışık problemlerin çözümü için yol açılmıştır.

İç içe dizi yapılarını mevcut sistemde kullanmak pek mümkün değildir. Fakat basit düzeyde ve 
tek seviyedeki markdown stringlerini başarılı bir şekilde diziyye ayrıştırabilmektedir. 

Yukarıdaki örnek string için 

result = [["header1", "Header1 örneği"], ["text", "düz yazı örneği."], ["header2", "Header2 örneği"],
 ["text", "düz yazı örneği."], ["header3", "Header3 Örneği"],
 ["text", "ama tabii olarak kalın ve eğik yazıların tartışılması başka bir konudur"],
 ["header4", "Header4 Örneği"], ["text", "olmasına olsa dahi yine de değişikliğe ihtiyac var"],
 ["header5", "Header5 Örneği"], ["text", "hala ic başlıklar"], ["header6", "Header6 Örneği"],
["text", "ve sonuc texti"]]

dizisini üretmektedir.

MarkdownParser sonuçları sıralı olarak tutan bir dizi olacak şekilde tasarlanmıştır.
["özellik_adı", "değer"]
şeklinde elemanlardan oluşur.

Sınıfın örnek kullanımı kodlarla gösterilmiştir.
=end
