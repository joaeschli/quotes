export PODNAME=$(kubectl get pods -l app=mysql -o jsonpath='{.items[0].metadata.name}')
kubectl cp ./create_database_quotesdb.sql $PODNAME:/tmp/create_database_quotesdb.sql
kubectl cp ./create_database.sh $PODNAME:/tmp/create_database.sh
kubectl exec deploy/mysql -- /bin/bash ./tmp/create_database.sh
kubectl cp ./create_table_quotes.sql $PODNAME:/tmp/create_table_quotes.sql
kubectl cp ./create_tables.sh $PODNAME:/tmp/create_tables.sh
kubectl exec deploy/mysql -- /bin/bash ./tmp/create_tables.sh
kubectl cp ./populate_table_quotes_BASH.sql $PODNAME:/tmp/populate_table_quotes_BASH.sql
kubectl cp ./quotes.csv $PODNAME:/tmp/quotes.csv
kubectl cp ./populate_tables_BASH.sh $PODNAME:/tmp/populate_tables_BASH.sh
kubectl exec deploy/mysql -- /bin/bash ./tmp/populate_tables_BASH.sh
kubectl cp ./query_table_quotes.sql $PODNAME:/tmp/query_table_quotes.sql
kubectl cp ./query_table_quotes.sh $PODNAME:/tmp/query_table_quotes.sh
kubectl exec deploy/mysql -- /bin/bash ./tmp/query_table_quotes.sh
