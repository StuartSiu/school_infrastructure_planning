# Optimizing School Infrastructure Planning

Reducing Enrollment Pressure in Surrey Schools for 2021-2025

Course: Math 402W Spring2017, Simon Fraser University

Team Members: Ruijie Jiang, William Lu, Stuart Siu, Trevor Tong, Dennis Yin 

## Objective
Developed a mathematical optimization model to solve capacity and resource allocation challenges for Surrey, British Columbia's public school system. The project utilizes integer programming to determine the optimal strategy for expanding school capacities, constructing new facilities, and redrawing catchment zones to minimize the gap between infrastructure capacity and projected student enrollment.


## The Business Problem
Rapidly growing municipalities frequently face misalignments between student population growth and existing school infrastructure. In Surrey, explosive population growth projected through 2025 has led to severe systemic overcrowding, currently requiring unsustainable reliance on temporary portable classrooms. City planners require a mathematically rigorous way to evaluate complex capital constraints to make optimal long-term infrastructure investments across multiple budget scenarios.


## Operations Research Methodology
The analysis was framed as a constrained optimization problem and solved using advanced operations research and forecasting techniques:

- **Demand Forecasting:** Utilized linear regression on government census tract data to project localized population growth and student enrollment demands for the 2021-2025 horizon.

  <img width="33%" alt="image" src="https://github.com/user-attachments/assets/e2cb7adf-ec33-4267-bf8d-2ffcc0c13cb1" />

  <img width="50%" alt="image" src="https://github.com/user-attachments/assets/54145bdd-72a9-46cc-be57-88fae3793aaa" />

- **Integer Programming:** Formulated a capacitated facility location model utilizing 6,861 variables and 12,178 constraints.

  <img width="558" height="69" alt="image" src="https://github.com/user-attachments/assets/df63df12-d502-411e-bdc3-c326020642fb" />

  ### Constraints:
  - The total number of transfers out of a zone should be no more than the number of excess students in the zone.
  - A school should not expand beyond its maximum capacity.
  - Two schools must be adjacent to each other in order to transfer students.
  - The total number of students transferring to a new school must be at most the capacity of the new school.
  - More students must transfer from within a zone than from any other nearby zone.
  - Each school is given an fixed allowance of overcapacity percentage from building portable classrooms. 
  - Total expenditure must be less than or equal to the capital budget.
  
- **Binary Decision Variables:** Programmed binary indicators to evaluate the cost-benefit of discrete capital decisions: whether to build a new facility at a predetermined location or expand an existing specific school.

  <img width="40%" alt="image" src="https://github.com/user-attachments/assets/cd9122be-3668-4747-bde0-02a050b5ba3e" />
  <img width="40%" alt="image" src="https://github.com/user-attachments/assets/59044c69-3d26-445b-8730-2edc56df6cc3" />

- **Catchment Re-zoning:** Conducted spatial reallocation of catchment boundaries based on optimized capacity distributions to minimize disruption to existing neighborhoods.
  
  <img width="25%" alt="image" src="https://github.com/user-attachments/assets/27f14317-b281-4b28-bc28-42781d3b1dad" />
  <img width="25%" alt="image" src="https://github.com/user-attachments/assets/39fbe714-2dbe-473f-a161-4e696e732b02" />


## Tech Stack
- **Mathematics:** Mathematical Optimization, Linear Programming, Operations Research.
- **Languages & Software:** AMPL, R.

## Key Insights
Running the model across three distinct capital budget scenarios ($250M, $300M, and $350M) yielded several critical insights into municipal infrastructure planning:

  <img width="33%" alt="image" src="https://github.com/user-attachments/assets/3aa9367c-e926-4462-bce4-6bee271dfcf6" />

- **Optimal Capital Allocation:** The optimal solution under a $350M capital budget dictated the construction of 2 new secondary schools and 10 new elementary schools, alongside 14 targeted expansions. This specific configuration achieved the most equitable distribution of overcrowding across the district, capping maximum overcapacity at 87%.
- **Budget Constraints:** The optimization model mathematically proved that the current capital budgets are insufficient to solve the city's infrastructure crisis. Even under perfectly optimized capital allocation at the highest tested budget ($350M), the system remains overcapacity by more than 25,000 students.
- **Strategic Recommendations:** The findings demonstrate that existing financial constraints are too binding. To properly address the overcrowding issue, the municipality must secure significantly higher capital budgets, fundamentally lower the costs of capital projects, or allow newly constructed schools to operate slightly overcapacity to relieve severe strain on existing neighboring facilities.

