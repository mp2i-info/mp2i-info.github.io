eleve:
	filename=$$(basename $$file); \
	jupyter nbconvert $$file --execute --to ipynb --output $$filename --allow-errors ; \ # execute corrected notebook
	jupyter nbconvert $$file --to ipynb --output $${filename%_cor.ipynb}.ipynb -TagRemovePreprocessor.remove_cell_tags cor # generate student notebook

all:
	for file in **/*_cor.ipynb; do \
		make eleve file=$$file; \
	done
