TEMPLATE=template-revealjs.html

git-workshop.html : git-workshop.markdown $(TEMPLATE)
	pandoc --section-divs \
			-t html5 \
			--standalone \
			--section-divs \
			--variable transition="linear" \
			--variable author="Sean L. Mooney" \
			--variable title="Git Workshop" \
			--template $(TEMPLATE) \
			-o git-workshop.html \
			git-workshop.markdown
