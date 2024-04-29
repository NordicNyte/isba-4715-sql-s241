import requests
import json

# Define the API key and base URL
apikey = "d687412e7b53146b2631dc01974ad0a4"
base_url = "https://marketplace.api.healthcare.gov/api/v1/plans/search"

# Define the headers
headers = {
    'content-type': 'application/json',
    'Authorization': f'Bearer {apikey}'
}

# Helper function to make API requests
def make_api_request(data):
    response = requests.post(base_url, headers=headers, json=data)
    if response.status_code == 200:
        return json.dumps(response.json(), indent=4)
    else:
        return f"Error: {response.status_code}, {response.text}"

# Define a list of example data payloads for different scenarios
data_examples = [
    {
        # Basic search for individual market plans
        "household": {"income": 45000, "people": [{"age": 30, "uses_tobacco": False}]},
        "market": "Individual",
        "place": {"state": "TX", "zipcode": "75001"},
        "year": 2024
    },
    {
        # Family plan search with APTC eligibility consideration
        "household": {
            "income": 60000,
            "people": [{"age": 35, "uses_tobacco": False, "aptc_eligible": True},
                       {"age": 33, "uses_tobacco": False},
                       {"age": 10, "uses_tobacco": False}]
        },
        "market": "Individual",
        "place": {"state": "FL", "zipcode": "33101"},
        "year": 2024
    },
    {
        # Plan search including quality ratings and specialist referral requirements
        "household": {"income": 70000, "people": [{"age": 45, "uses_tobacco": True}]},
        "market": "Individual",
        "place": {"state": "CA", "zipcode": "90001"},
        "year": 2024,
        "additional_criteria": {
            "quality_rating": 3,
            "specialist_referral_required": True
        }
    },
    {
        # Search for plans with specific disease management programs
        "household": {"income": 55000, "people": [{"age": 50, "uses_tobacco": False}]},
        "market": "Individual",
        "place": {"state": "NY", "zipcode": "10001"},
        "year": 2024,
        "additional_criteria": {
            "disease_mgmt_programs": ["Diabetes", "Heart Disease"]
        }
    },
    {
        # Advanced search with multiple filters: metal level, MOOPs, and deductibles
        "household": {"income": 80000, "people": [{"age": 40, "uses_tobacco": False}]},
        "market": "Individual",
        "place": {"state": "IL", "zipcode": "60601"},
        "year": 2024,
        "additional_criteria": {
            "metal_level": "Gold",
            "moops": {"type": "individual", "amount": {"max": 5000}},
            "deductibles": {"type": "individual", "amount": {"max": 2000}}
        }
    }
]

# Loop through data examples and print the API responses
for data in data_examples:
    print(f"Querying data for scenario with household income: {data['household']['income']}")
    print(make_api_request(data))
    print("-" * 80)  # Separator for clarity in output