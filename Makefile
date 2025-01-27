run_app:
	python3 app.py & sleep 30

	wget -r http://127.0.0.1:8050/
	wget -r http://127.0.0.1:8050/_dash-layout 
	wget -r http://127.0.0.1:8050/_dash-dependencies

	wget -r http://127.0.0.1:8050/_dash-component-suites/dash/dcc/async-graph.js
	wget -r http://127.0.0.1:8050/_dash-component-suites/dash/dcc/async-highlight.js
	wget -r http://127.0.0.1:8050/_dash-component-suites/dash/dcc/async-markdown.js
	wget -r http://127.0.0.1:8050/_dash-component-suites/dash/dcc/async-datepicker.js

	wget -r http://127.0.0.1:8050/_dash-component-suites/dash/dash_table/async-table.js
	wget -r http://127.0.0.1:8050/_dash-component-suites/dash/dash_table/async-highlight.js

	wget -r http://127.0.0.1:8050/_dash-component-suites/plotly/package_data/plotly.min.js

	wget -r http://127.0.0.1:8050/dashboard/assets/style.css
	wget -r http://127.0.0.1:8050/dashboard/assets/custom.js

	mv 127.0.0.1:8050 pages_files
	
	REPO_PATH=dash-gh-actions

	find pages_files -type f -exec sed -i.bak "s|_dash-component-suites|${REPO_PATH}\\/_dash-component-suites|g" {} \;
	find pages_files -type f -exec sed -i.bak "s|_dash-layout|${REPO_PATH}/_dash-layout.json|g" {} \;
	find pages_files -type f -exec sed -i.bak "s|_dash-dependencies|${REPO_PATH}/_dash-dependencies.json|g" {} \;
	find pages_files -type f -exec sed -i.bak "s|_reload-hash|${REPO_PATH}/_reload-hash|g" {} \;
	find pages_files -type f -exec sed -i.bak "s|_dash-update-component|${REPO_PATH}/_dash-update-component|g" {} \;
	find pages_files -type f -exec sed -i.bak "s|assets|${REPO_PATH}/assets|g" {} \;


	# find pages_files -exec sed -i.bak 's|_dash-component-suites|dash-actions-tutorial\\/_dash-component-suites|g' {} \;
	# find pages_files -exec sed -i.bak 's|_dash-layout|dash-actions-tutorial/_dash-layout.json|g' {} \;
	# find pages_files -exec sed -i.bak 's|_dash-dependencies|dash-actions-tutorial/_dash-dependencies.json|g' {} \;
	# find pages_files -exec sed -i.bak 's|_reload-hash|dash-actions-tutorial/_reload-hash|g' {} \;
	# find pages_files -exec sed -i.bak 's|_dash-update-component|dash-actions-tutorial/_dash-update-component|g' {} \;
	# find pages_files -exec sed -i.bak 's|assets|dash-actions-tutorial/assets|g' {} \;


	mv pages_files/_dash-layout pages_files/_dash-layout.json
	mv pages_files/_dash-dependencies pages_files/_dash-dependencies.json

	ps -C python -o pid= | xargs -r kill -9

clean_dirs:
	ls
	rm -rf 127.0.0.1:8050/
	rm -rf pages_files/
	rm -rf joblib