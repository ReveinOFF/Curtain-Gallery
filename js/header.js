// Get all sub-catalogs and render to header
fetch("./server/catalog/get_subcatalog.php", {
  method: "GET",
  headers: {
    "Content-Type": "application/json",
  },
})
  .then((response) => response.json())
  .then((res) => {
    // Group all sub-catalogs by catalog
    const groupedData = res.reduce((acc, curr) => {
      const key = curr.catalog_name;
      if (!acc[key]) {
        acc[key] = [];
      }
      acc[key].push(curr);
      return acc;
    }, {});

    // Get html document data
    let catalog_s1 = document.getElementById("catalog_s1");
    let catalog_s2 = document.getElementById("catalog_s2");
    let catalog_s3 = document.getElementById("catalog_s3");
    let catalog_sm1 = document.getElementById("catalog_sm1");
    let catalog_sm2 = document.getElementById("catalog_sm2");
    let catalog_sm3 = document.getElementById("catalog_sm3");

    // Render all sub-catalogs
    // Get the catalogs name and all sub-catalogs bound to the catalog:
    Object.entries(groupedData).forEach(([catalogName, items]) => {
      // Get the sub-catalogs and render to catalog document:
      items.forEach((element) => {
        let link = document.createElement("a");
        link.href = `/subcatalog?id=${element.id}`;
        link.textContent = element.name;

        switch (catalogName) {
          case "Штори":
            catalog_s1.appendChild(link);
            catalog_sm1.appendChild(link.cloneNode(true));
            break;
          case "Тюль":
            catalog_s2.appendChild(link);
            catalog_sm2.appendChild(link.cloneNode(true));
            break;
          case "Тасьма":
            catalog_s3.appendChild(link);
            catalog_sm3.appendChild(link.cloneNode(true));
            break;
        }
      });
    });
  })
  .catch((error) => console.error("Помилка загрузки каталога:", error));
