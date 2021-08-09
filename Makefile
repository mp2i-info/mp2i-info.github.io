eleve:
	filename=$$(basename $$file); \
	jupyter nbconvert $$file --execute --to ipynb --output $$filename --allow-errors ; \
	jupyter nbconvert $$file --to ipynb --output $${filename%_cor.ipynb}.ipynb --TagRemovePreprocessor.enabled=True --TagRemovePreprocessor.remove_cell_tags cor

all:
	for file in **/*_cor.ipynb; do \
		make eleve file=$$file; \
	done
