import dlt
import argparse
import pandas as pd


def stream_csv(table_name):
    yield pd.read_csv(f"data/{table_name}.csv")


def main(table_name, table_catalog="raw", table_schema="movies"):
    pipeline = dlt.pipeline(
        pipeline_name="iceberg_filesystem_csv",
        destination="filesystem",
        dataset_name=f"raw_{table_schema}",
        progress="log",
    )

    load_info = pipeline.run(
        stream_csv(table_name),
        write_disposition="append",
        table_name=table_name,
        table_format="iceberg",
    )

    print(load_info)
    print(pipeline.last_trace.last_normalize_info)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Process CSV files into Iceberg tables."
    )
    parser.add_argument(
        "-t", "--table", type=str, help="Name of the table", required=True
    )
    args = parser.parse_args()
    main(args.table)
