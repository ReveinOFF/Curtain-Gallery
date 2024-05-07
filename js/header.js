fetch("./server/catalog/get_subcatalog.php", {
  method: "GET",
  headers: {
    "Content-Type": "application/json",
  },
})
  .then((response) => response.json())
  .then((res) => {
    const groupedData = res.reduce((acc, curr) => {
      const key = curr.catalog_name;
      if (!acc[key]) {
        acc[key] = [];
      }
      acc[key].push(curr);
      return acc;
    }, {});

    let catalog_s1 = document.getElementById("catalog_s1");
    let catalog_s2 = document.getElementById("catalog_s2");
    let catalog_s3 = document.getElementById("catalog_s3");

    let catalog_sm1 = document.getElementById("catalog_sm1");
    let catalog_sm2 = document.getElementById("catalog_sm2");
    let catalog_sm3 = document.getElementById("catalog_sm3");

    Object.entries(groupedData).forEach(([catalogName, items]) => {
      items.forEach((element) => {
        let link = document.createElement("a");
        switch (catalogName) {
          case "Штори":
            link.href = `/subcatalog?id=${element.id}`;
            link.textContent = element.name;
            catalog_s1.appendChild(link);
            catalog_sm1.appendChild(link);
            break;
          case "Тюль":
            link.href = `/subcatalog?id=${element.id}`;
            link.textContent = element.name;
            catalog_s2.appendChild(link);
            catalog_sm2.appendChild(link);
            break;
          case "Тасьма":
            link.href = `/subcatalog?id=${element.id}`;
            link.textContent = element.name;
            catalog_s3.appendChild(link);
            catalog_sm3.appendChild(link);
            break;
        }
      });
    });
  })
  .catch((error) => console.error("Помилка загрузки каталога:", error));
