#include <iostream>
#include <string>
#include <vector>
#include "json.hpp"

using json = nlohmann::json;

int main(int argc, char* argv[]) {
    // Check if a JSON string is provided as a command-line argument
    if (argc != 2) {
        std::cerr << "Usage: " << argv[0] << " <json_data>" << std::endl;
        return 1;  // Exit with an error code
    }

    // Parse JSON
    std::string jsonString(argv[1]);
    json parsedData;

    try {
        parsedData = json::parse(jsonString);
    } catch (const std::exception& e) {
        std::cerr << "Error parsing JSON: " << e.what() << std::endl;
        return 1;  // Exit with an error code
    }
	//
    // Map to store window names sorted by output
    std::map<std::string, std::vector<std::string>> windowNamesByOutput;
	std::string focusedWindowName;

    // Extract window names and sort by output
    for (const auto& workspace : parsedData) {
        std::string output = workspace["output"];
        std::string windowName = workspace["name"];
		if (workspace["focused"]) {
			focusedWindowName = windowName;
		}
        windowNamesByOutput[output].push_back(windowName);
    }

	std::string outputString = "";

    // Display window names sorted by output
    for (const auto& entry : windowNamesByOutput) {
        for (const auto& windowName : entry.second) {
			if (windowName == focusedWindowName) {
				outputString += "|" + windowName + "|";
			}
			else {
				outputString += "=" + windowName + "=";
			}
        }
    }

	// Print the final string
	std::cout << outputString << std::endl;
}
