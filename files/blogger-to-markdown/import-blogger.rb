require "jekyll-import";

    JekyllImport::Importers::Blogger.run({
      "source"                => "blog-01-17-2021.xml",
      "no-blogger-info"       => false,
      "replace-internal-link" => false,
    })