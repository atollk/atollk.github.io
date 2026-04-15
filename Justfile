image:="jvconseil/jekyll-docker:4.3.3"

jekyll-new site_name:
    podman run --rm --volume="$PWD:/srv/jekyll" -it {{image}} sh -c "chown -R jekyll /usr/gem/ && jekyll new {{site_name}}"

jekyll command:
    podman run --rm --volume="$PWD:/srv/jekyll:Z" -it {{image}} {{command}}

install: (jekyll "bundle install")

build: (jekyll "jekyll build")

serve:
    podman run --rm --volume="$PWD:/srv/jekyll:Z" --publish [::1]:4000:4000 -it {{image}} jekyll serve