def page_attributes(overrides = {})
  {
    title: "Page title",
    body: %{ Adipisicing perferendis optio recusandae quas quam ipsam harum
            tempora quos fugiat obcaecati asperiores, vero ipsum iste
            perspiciatis ipsa laborum a officiis repudiandae ullam voluptatibus. 
            Modi aut libero dicta quibusdam illum. }.squish
  }.merge(overrides)
end
