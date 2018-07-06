//
//  TodayViewController.swift
//  Fitness
//
//  Created by Ludovic Ollagnier on 06/07/2018.
//  Copyright © 2018 Tec-Tec. All rights reserved.
//

import UIKit

class TodayViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if User.current != nil {
            configureUI()
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        guard User.current != nil else {
            performSegue(withIdentifier: "showOnboarding", sender: nil)
            return
        }
    }

    private func configureUI() {

        let startDate = Date()
        let endDate = startDate.addingTimeInterval(1800)

        let yoga = Yoga(startDate: startDate, endDate: endDate, heartRate: 60)
        let yoga2 = Yoga(startDate: startDate, endDate: endDate, heartRate: 150)
        let yoga3 = Yoga(startDate: startDate, endDate: endDate, heartRate: 120)
        let yoga4 = Yoga(startDate: startDate, endDate: endDate, heartRate: 110)
        let yoga5 = Yoga(startDate: startDate, endDate: endDate, heartRate: 180)
        let foot = Football(isIndoor: false, startDate: startDate, endDate: endDate, heartRate: 150, team: [])

        User.current?.lastActivities = [yoga, yoga2, yoga3, yoga4, yoga5, foot, yoga, yoga2, yoga4, foot, yoga3]

        tableView.reloadData()
    }

}

extension TodayViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return User.current?.lastActivities.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "activityCell", for: indexPath) as! ActivityTableViewCell

        let activity = User.current!.lastActivities[indexPath.row]

        cell.configure(with: activity)

        return cell
    }


}









